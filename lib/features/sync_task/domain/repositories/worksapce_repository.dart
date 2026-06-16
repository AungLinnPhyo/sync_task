import '../entities/workspace_entity.dart';

abstract class WorkspaceRepository {
  Stream<List<WorkspaceEntity>> watchWorkspaces();

  Future<void> createWorkspace(String name);

  Future<void> syncFromRemote();

  Future<void> updateWorkspace(int id, String name);
}
