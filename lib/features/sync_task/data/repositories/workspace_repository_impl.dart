import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/workspace_entity.dart';
import '../../domain/repositories/worksapce_repository.dart';
import '../data_sources/local/daos/outbox_dao.dart';
import '../data_sources/local/daos/workspace_dao.dart';

class WorkspaceRepositoryImpl implements WorkspaceRepository {
  final WorkspaceDao _localDao; // Data Access Object
  final OutboxDao _outboxDao;
  // final WorkspaceRemoteDataSource _remoteDataSource;
  final _uuid = const Uuid();

  WorkspaceRepositoryImpl(this._localDao, this._outboxDao);

  @override
  Future<void> createWorkspace(String name) async {
    // UI ကနေ ဒေတာအသစ်ဆောက်ခိုင်းလျှင် ချက်ချင်း ယာယီ UUID String ထုတ်သည်
    final tempId = 'w-${_uuid.v4()}';

    // Local Database (Drift) ထဲသို့ ချက်ချင်း အော့ဖ်လိုင်းပြသနိုင်ရန် အရင်သိမ်းသည်
    await _localDao.insertWorkspace(WorkspaceTableCompanion.insert(id: tempId, name: name, createdAt: Value(DateTime.now())));

    //🚨 အရေးကြီးဆုံးအပိုင်း: ဆာဗာသို့ ပို့ရန်အတွက် Outbox Queue ထဲသို့ အလုပ်တစ်ခုအနေဖြင့် ထည့်သွင်းရမည်
    await _outboxDao.insertItem(
      OutboxTableCompanion.insert(
        url: 'workspaces',
        method: 'POST',
        actionType: 'createWorkspace',
        clientReferenceId: Value(tempId), // 💡 X-Idempotency-Key အတွက် ယာယီ UUID အား ထည့်ပေးလိုက်သည်
        payload: '{"name": "$name"}',
        createdAt: Value(DateTime.now()),
        status: const Value('pending'),
      ),
    );

    // ref.read(offlineSyncEngineProvider).triggerSync();
  }

  @override
  Stream<List<WorkspaceEntity>> watchWorkspaces() {
    // Local Drift DB ထဲက ဒေတာတွေကို စောင့်ကြည့်ပြီး UI ဆီ Entity အဖြစ် ပြောင်းပေးသည်
    return _localDao.watchAllWorkspaces().map((items) {
      return items.map((item) => WorkspaceEntity(id: item.id, createdAt: item.createdAt, name: item.name)).toList();
    });
  }
}
