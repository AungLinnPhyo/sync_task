import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/dependency_injection/dependency_injections.dart';
import '../../domain/entities/workspace_entity.dart';

final workspacesStreamProvider = StreamProvider<List<WorkspaceEntity>>((ref) {
  final usecase = ref.watch(workspaceUsecaseProvider);
  return usecase.watchWorkspaces(); // 💡 တိုက်ရိုက် ခေါ်ယူခြင်း
});

// UI Controller -> Consolidated Use Case မှ create Method အား ခေါ်ခြင်း
class WorkspaceController extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;
  WorkspaceController(this._ref) : super(const AsyncValue.data(null));

  Future<void> addWorkspace(String name) async {
    state = const AsyncValue.loading();
    try {
      // 💡 အသစ်ဆောက်ထားသော Method အား လှမ်းခေါ်ခြင်း
      await _ref.read(workspaceUsecaseProvider).createWorkspace(name);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final workspaceControllerProvider = StateNotifierProvider<WorkspaceController, AsyncValue<void>>((ref) {
  return WorkspaceController(ref);
});