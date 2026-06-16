import 'dart:convert';
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/workspace_entity.dart';
import '../../domain/repositories/worksapce_repository.dart';
import '../data_sources/local/daos/outbox_dao.dart';
import '../data_sources/local/daos/workspace_dao.dart';
import '../data_sources/remotes/workspace_remote_data_source.dart';

class WorkspaceRepositoryImpl implements WorkspaceRepository {
  final WorkspaceDao _localDao;
  final OutboxDao _outboxDao;
  final WorkspaceRemoteDataSource _remoteDataSource;
  final _uuid = const Uuid();

  WorkspaceRepositoryImpl(this._localDao, this._outboxDao, this._remoteDataSource);

  @override
  Future<void> createWorkspace(String name) async {
    final idempotencyKey = _uuid.v4();

    // 1️⃣ Local DB ထဲသို့ သိမ်းဆည်းပြီး Auto-increment localId ကို ရယူသည်
    final localId = await _localDao.insertWorkspace(WorkspaceTableCompanion.insert(name: name, createdAt: Value(DateTime.now())));

    // 2️⃣ Payload ထဲတွင် localId ကို သေချာပေါက် int အတိုင်း ထည့်သွင်းပေးလိုက်သည်
    await _outboxDao.insertItem(
      OutboxTableCompanion.insert(
        url: 'workspaces',
        method: 'POST',
        actionType: 'createWorkspace',
        clientReferenceId: Value(idempotencyKey),
        payload: jsonEncode({"localId": localId, "name": name}), // 🎯 တိကျသော Payload
        createdAt: Value(DateTime.now()),
        status: const Value('pending'),
      ),
    );
  }

  @override
  Stream<List<WorkspaceEntity>> watchWorkspaces() {
    return _localDao.watchAllWorkspaces().map((items) {
      return items.map((item) {
        return WorkspaceEntity(
          localId: item.id,
          serverId: item.serverId, // 🎯 အောက်က ပြင်လိုက်သဖြင့် serverId သည် null မဖြစ်တော့ပါ
          name: item.name,
          createdAt: item.createdAt,
        );
      }).toList();
    });
  }

  @override
  Future<void> syncFromRemote() async {
    // ၁။ ဆာဗာမှ ဒေတာများကို လှမ်းယူသည်
    final remoteWorkspaces = await _remoteDataSource.fetchWorkspaces();
    log('📥 Received ${remoteWorkspaces.length} workspaces from server.');

    // ၂။ Outbox ထဲတွင် စောင့်ဆိုင်းနေဆဲဖြစ်သော (မပြောင်းလဲရသေးသော) Local Int IDs များကို Payload ထဲမှ ဖတ်ယူမည်
    final outboxItems = await _outboxDao.getAllPending();
    final pendingLocalIds = outboxItems
        .where((item) => item.actionType == 'createWorkspace')
        .map((item) {
          try {
            final payload = jsonDecode(item.payload) as Map<String, dynamic>;
            return payload['localId'] as int?;
          } catch (_) {
            return null;
          }
        })
        .whereType<int>()
        .toSet();

    // Pending မဟုတ်သော Local Data အဟောင်းများကိုသာ ရွေးဖျက်သည် (အော့ဖ်လိုင်းဒေတာများ မပျက်တော့ပါ)
    final currentLocalWorkspaces = await _localDao.getAllWorkspaces();
    for (final local in currentLocalWorkspaces) {
      if (!pendingLocalIds.contains(local.id)) {
        await _localDao.deleteWorkspace(local.id);
      }
    }

    // ၃။ ဆာဗာမှရလာသော ဒေတာများကို Local DB သို့ မှန်ကန်သော ကော်လံဖြင့် ပြန်သွင်းသည်
    for (final model in remoteWorkspaces) {
      final numericId = int.tryParse(model.serverId ?? '');
      await _localDao.insertWorkspace(
        WorkspaceTableCompanion(id: numericId != null ? Value(numericId) : const Value.absent(), serverId: Value(model.serverId), name: Value(model.name), createdAt: Value(model.createdAt)),
      );
    }
  }

  @override
  Future<void> updateWorkspace(int id, String newName) async {
    await _localDao.updateWorkspaceLocal(id, newName);

    // 💡 ဆာဗာထံ Update လှမ်းလုပ်ရန်အတွက် ဆာဗာ ID ကို အရင်ရှာပါ
    final workspace = await _localDao.getWorkspaceById(id);
    final String serverOrLocalId = workspace?.serverId ?? 'local_$id';

    await _outboxDao.insertItem(
      OutboxTableCompanion.insert(
        method: 'PUT',
        clientReferenceId: Value(id.toString()),
        actionType: "updateWorkspace",
        url: 'workspaces/$serverOrLocalId', // 🎯 စိတ်ချရအောင် ဆာဗာ ID ကို သုံးပြီး Path တည်ဆောက်သည်
        payload: jsonEncode({'name': newName}),
        status: const Value('pending'),
        createdAt: Value(DateTime.now()),
      ),
    );
  }
}
