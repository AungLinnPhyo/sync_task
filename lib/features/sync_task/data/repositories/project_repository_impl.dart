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
    return _projectDao.watchProjectsByWorkspace(workspaceId).map((driftItems) {
      return driftItems.map((item) => ProjectEntity(id: item.id, workspaceId: item.workspaceId, name: item.name, createdAt: item.createdAt)).toList();
    });
  }

  @override
  Future<void> createProject({required String name, required String workspaceId}) async {
    // ၁။ ပရောဂျက်အတွက် ယာယီ UUID ထုတ်ယူခြင်း
    final tempProjectId = 'p-${_uuid.v4()}';

    // ၂။ Local Project Table ထဲသို့ ချက်ချင်း သွင်းခြင်း
    await _projectDao.insertProject(
      ProjectTableCompanion.insert(
        id: tempProjectId,
        workspaceId: workspaceId, // 💡 ယာယီဖြစ်စေ၊ ဆာဗာ ID ဖြစ်စေ လက်ရှိ ID အတိုင်းသွင်းမည်
        name: name,
        createdAt: Value(DateTime.now()),
      ),
    );

    // ၃။ သင့် OutboxDao ကိုသုံးပြီး 'createProject' အလုပ်အား Queue ထဲထည့်ခြင်း
    await _outboxDao.insertItem(
      OutboxTableCompanion.insert(
        url: 'projects',
        method: 'POST',
        actionType: 'createProject', // 💡 CreateProjectProcessor ၏ actionType နှင့် ကွက်တိတူရမည်
        payload: '{"name": "$name", "workspaceId": "$workspaceId"}', // Payload ထဲတွင် Parent ID အား ထည့်ပေးလိုက်သည်
        clientReferenceId: Value(tempProjectId),
        createdAt: Value(DateTime.now()),
        status: const Value('pending'),
      ),
    );
  }
}
