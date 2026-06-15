import 'package:drift/drift.dart';
import '../../../../../../core/database/app_database.dart';
import '../schema/workspace_table.dart';

part 'workspace_dao.g.dart';

@DriftAccessor(tables: [WorkspaceTable])
class WorkspaceDao extends DatabaseAccessor<AppDatabase> with _$WorkspaceDaoMixin {
  WorkspaceDao(super.db);

  Future<List<WorkspaceTableData>> getAllWorkspaces() => select(workspaceTable).get();

  Stream<List<WorkspaceTableData>> watchAllWorkspaces() => select(workspaceTable).watch();

  Future<void> insertWorkspace(WorkspaceTableCompanion workspace) => into(workspaceTable).insertOnConflictUpdate(workspace);

  Future<WorkspaceTableData?> getWorkspaceById(String id) => (select(workspaceTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> deleteWorkspace(String id) => (delete(workspaceTable)..where((t) => t.id.equals(id))).go();

  Future<void> clearAll() => delete(workspaceTable).go();
}
