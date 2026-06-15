import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/dependency_injection/dependency_injections.dart';
import '../../domain/entities/project_entity.dart';

// Workspaceတစ်ခုချင်းစီအလိုက် ပရိုဂျက်များကို နားထောင်မည့် Stream Provider
final projectsStreamProvider = StreamProvider.family<List<ProjectEntity>, String>((ref, workspaceId) {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.watchProjects(workspaceId);
});

class ProjectController extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  ProjectController(this._ref) : super(const AsyncValue.data(null));

  Future<void> addProject(String name, String workspaceId) async {
    state = const Duration(seconds: 0) as AsyncValue<void>; // loading state ပြောင်းရန်
    state = const AsyncValue.loading();
    try {
      await _ref.read(projectRepositoryProvider).createProject(
        name: name,
        workspaceId: workspaceId,
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final projectControllerProvider = StateNotifierProvider<ProjectController, AsyncValue<void>>((ref) {
  return ProjectController(ref);
});