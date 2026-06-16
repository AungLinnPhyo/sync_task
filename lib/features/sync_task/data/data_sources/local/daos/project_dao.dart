import 'package:drift/drift.dart';
import '../../../../../../core/database/app_database.dart';
import '../schema/project_table.dart';

part 'project_dao.g.dart';

@DriftAccessor(tables: [ProjectTable])
class ProjectDao extends DatabaseAccessor<AppDatabase> with _$ProjectDaoMixin {
  ProjectDao(super.db);

  Stream<List<ProjectTableData>> watchProjectsByWorkspace(int localWorkspaceId) {
    return (select(projectTable)..where((t) => t.workspaceId.equals(localWorkspaceId))).watch();
  }

  // Data အသစ်သိမ်းဆည်းပြီး Local Int ID ပြန်ထုတ်ပေးရန်
  Future<int> insertProject(ProjectTableCompanion project) => into(projectTable).insertOnConflictUpdate(project);

  Future<void> deleteProject(int id) => (delete(projectTable)..where((t) => t.id.equals(id))).go();

  Future<void> clearAll() => delete(projectTable).go();

  // ဆာဗာ ID ကျလာပါက ဖုန်းထဲတွင် လာရောက် Update လုပ်ရန်
  Future<bool> updateServerId(int localId, String serverId) async {
    await (update(projectTable)..where((t) => t.id.equals(localId))).write(ProjectTableCompanion(serverId: Value(serverId)));
    return true;
  }
}
