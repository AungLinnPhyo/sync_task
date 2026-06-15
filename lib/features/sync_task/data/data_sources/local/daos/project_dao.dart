import 'package:drift/drift.dart';
import '../../../../../../core/database/app_database.dart';
import '../schema/project_table.dart';

part 'project_dao.g.dart';

@DriftAccessor(tables: [ProjectTable])
class ProjectDao extends DatabaseAccessor<AppDatabase> with _$ProjectDaoMixin {
  ProjectDao(super.db);

  Stream<List<ProjectTableData>> watchProjectsByWorkspace(String workspaceId) {
    return (select(projectTable)..where((t) => t.workspaceId.equals(workspaceId))).watch();
  }

  Future<void> insertProject(ProjectTableCompanion project) => into(projectTable).insertOnConflictUpdate(project);

  Future<void> deleteProject(String id) => (delete(projectTable)..where((t) => t.id.equals(id))).go();

  Future<void> clearAll() => delete(projectTable).go();
}
