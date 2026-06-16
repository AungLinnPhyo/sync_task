import '../entities/project_entity.dart';

abstract class ProjectRepository {
  Stream<List<ProjectEntity>> watchProjects(String workspaceId);
  Future<void> createProject({required String name, required int localWorkspaceId});
}
