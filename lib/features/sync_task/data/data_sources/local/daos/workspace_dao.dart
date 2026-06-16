import 'package:drift/drift.dart';
import '../../../../../../core/database/app_database.dart';
import '../schema/workspace_table.dart';

part 'workspace_dao.g.dart';

@DriftAccessor(tables: [WorkspaceTable])
class WorkspaceDao extends DatabaseAccessor<AppDatabase> with _$WorkspaceDaoMixin {
  WorkspaceDao(super.db);

  Future<List<WorkspaceTableData>> getAllWorkspaces() => select(workspaceTable).get();

  // stream UI
  Stream<List<WorkspaceTableData>> watchAllWorkspaces() => select(workspaceTable).watch();

  // data သိမ်းရန်
  Future<int> insertWorkspace(WorkspaceTableCompanion workspace) => into(workspaceTable).insertOnConflictUpdate(workspace);

  Future<WorkspaceTableData?> getWorkspaceById(int id) => (select(workspaceTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> updateWorkspaceLocal(int id, String name) async => await (update(workspaceTable)..where((t) => t.id.equals(id))).write(WorkspaceTableCompanion(name: Value(name)));

  Future<void> deleteWorkspace(int id) => (delete(workspaceTable)..where((t) => t.id.equals(id))).go();


  Future<bool> updateServerId(int localId, String serverId) async {
    await (update(workspaceTable)..where((t) => t.id.equals(localId))).write(WorkspaceTableCompanion(serverId: Value(serverId)));
    return true;
  }

  Future<void> clearAll() => delete(workspaceTable).go();
}
