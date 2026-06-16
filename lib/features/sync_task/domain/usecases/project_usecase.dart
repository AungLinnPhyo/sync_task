import '../entities/project_entity.dart';
import '../repositories/project_repository.dart';

class ProjectUsecase {
  final ProjectRepository _repository;
  ProjectUsecase(this._repository);

  Stream<List<ProjectEntity>> watchProjects(String workspaceId) => _repository.watchProjects(workspaceId);

  Future<void> createProject({required String name, required int localWorkspaceId}) async {
    if (name.isEmpty) throw Exception('Project name cannot be empty');
    return _repository.createProject(name: name, localWorkspaceId: localWorkspaceId);
  }
}
