import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/dependency_injection/dependency_injections.dart';
import '../../domain/entities/workspace_entity.dart';

// UI က နားထောင်မည့် Live Data Stream
final workspacesStreamProvider = StreamProvider<List<WorkspaceEntity>>((ref) {
  final repository = ref.watch(workspaceRepositoryProvider); // DI ဆီမှ တောင်းယူခြင်း
  return repository.watchWorkspaces();
});

// UI Event (ဥပမာ- ခလုတ်နှိပ်ခြင်း) နှင့် Loading State အား စီမံရန် Controller
class WorkspaceController extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  WorkspaceController(this._ref) : super(const AsyncValue.data(null));

  Future<void> addWorkspace(String name) async {
    state = const AsyncValue.loading();
    try {
      // DI Folder ထဲမှ Repository ကို လှမ်းသုံးပြီး ဒေတာ အသစ်ဆောက်သည်
      await _ref.read(workspaceRepositoryProvider).createWorkspace(name);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final workspaceControllerProvider = StateNotifierProvider<WorkspaceController, AsyncValue<void>>((ref) {
  return WorkspaceController(ref);
});