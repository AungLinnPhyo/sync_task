import '../entities/workspace_entity.dart';
import '../repositories/worksapce_repository.dart';

class WorkspaceUsecase {
  final WorkspaceRepository _repository;
  WorkspaceUsecase(this._repository);

  Stream<List<WorkspaceEntity>> watchWorkspaces() => _repository.watchWorkspaces();

  Future<void> createWorkspace(String name) async {
    if (name.isEmpty) throw Exception('Workspace name cannot be empty');
    return _repository.createWorkspace(name);
  }

  Future<void> syncFromRemote() => _repository.syncFromRemote();
}
