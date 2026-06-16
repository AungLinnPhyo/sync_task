import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository.dart';
import '../data_sources/local/daos/outbox_dao.dart';
import '../data_sources/local/daos/project_dao.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDao _projectDao;
  final OutboxDao _outboxDao;
  final _uuid = const Uuid();

  ProjectRepositoryImpl(this._projectDao, this._outboxDao);

  @override
  Stream<List<ProjectEntity>> watchProjects(String workspaceId) {
    // ၁။ ဝင်လာသော String Workspace ID အား Local DB က နားလည်မည့် int ပြောင်းသည်
    final localWorkspaceId = int.tryParse(workspaceId) ?? 0;

    return _projectDao.watchProjectsByWorkspace(localWorkspaceId).map((driftItems) {
      return driftItems.map((item) {
        // 🎯 သန့်ရှင်းကျစ်လျစ်သွားသော ဒေတာ Mapping စနစ်
        return ProjectEntity(
          localId: item.id, // 🏠 Drift ကပေးသော int id ကို တိုက်ရိုက်ထည့်သည်
          serverId: item.serverId, // 🌐 String? serverId ကို တိုက်ရိုက်ထည့်သည်
          localWorkspaceId: item.workspaceId, // 🏠 Local Workspace Int ID ကို တိုက်ရိုက်ထည့်သည်
          name: item.name,
          createdAt: item.createdAt,
        );
      }).toList();
    });
  }

  @override
  Future<void> createProject({required String name, required int localWorkspaceId}) async {
    final idempotencyKey = _uuid.v4(); // Network Safety အတွက် သီးသန့် UUID

    // ၁။ Local DB ထဲသို့ အရင်သိမ်းပြီး Project ၏ Local Int ID ကို ယူသည်
    final localProjectId = await _projectDao.insertProject(ProjectTableCompanion.insert(name: name, workspaceId: localWorkspaceId));

    // ၂။ Outbox Queue ထဲသို့ ထည့်သွင်းမည်
    await _outboxDao.insertItem(
      OutboxTableCompanion.insert(
        url: 'projects',
        method: 'POST',
        actionType: 'createProject',
        clientReferenceId: Value(idempotencyKey),
        // 🎯 Payload ထဲတွင် ID ရော၊ Workspace ID ပါ ထည့်ပေးလိုက်ပါပြီ
        payload: jsonEncode({"localId": localProjectId, "localWorkspaceId": localWorkspaceId, "name": name}),
        createdAt: Value(DateTime.now()),
        status: const Value('pending'),
      ),
    );
  }
}
