import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/dependency_injection/dependency_injections.dart';
import '../../domain/entities/project_entity.dart';

final projectsStreamProvider = StreamProvider.family<List<ProjectEntity>, String>((ref, workspaceId) {
  final usecase = ref.watch(projectUsecaseProvider);
  return usecase.watchProjects(workspaceId);
});

class ProjectController extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;
  ProjectController(this._ref) : super(const AsyncValue.data(null));

  Future<void> addProject(String name, int workspaceId) async {
    state = const AsyncValue.loading();
    try {
      await _ref.read(projectUsecaseProvider).createProject(name: name, localWorkspaceId: workspaceId);
      state = const AsyncValue.data(null);
      // 🎯 ၂။ [အရေးကြီးဆုံးအဆင့်] ဒေတာသွင်းပြီးသည်နှင့် ချက်ချင်း Sync Engine ကို လှမ်းနှိုးပါ
      _ref.read(offlineSyncEngineProvider).triggerSync();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final projectControllerProvider = StateNotifierProvider<ProjectController, AsyncValue<void>>((ref) {
  return ProjectController(ref);
});
