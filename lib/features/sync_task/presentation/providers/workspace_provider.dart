import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/dependency_injection/dependency_injections.dart';
import '../../domain/entities/workspace_entity.dart';
import 'outbox_provider.dart';

final workspacesStreamProvider = StreamProvider<List<WorkspaceEntity>>((ref) {
  // 🎯 Outbox ကို watch ထားခြင်းဖြင့် Sync အောင်မြင်ပြီး Outbox ထဲက item လျော့သွားချိန်မှာ
  // ဒီ Provider ကိုပါ auto-refresh ဖြစ်စေပြီး Server ID အသစ်ကို mapping table ထဲကနေ ပြန်ဆွဲထုတ်ခိုင်းတာဖြစ်ပါတယ်
  ref.watch(outboxItemsStreamProvider);

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
      // ၁။ Local DB နှင့် Outbox ထဲသို့ ဒေတာ အရင်သွင်းသည်
      await _ref.read(workspaceUsecaseProvider).createWorkspace(name);
      state = const AsyncValue.data(null);
      // 🎯 ၂။ [အရေးကြီးဆုံးအဆင့်] ဒေတာသွင်းပြီးသည်နှင့် ချက်ချင်း Sync Engine ကို လှမ်းနှိုးပါ
      _ref.read(offlineSyncEngineProvider).triggerSync();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshFromServer() async {
    state = const AsyncValue.loading();
    try {
      await _ref.read(workspaceUsecaseProvider).syncFromRemote();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final workspaceControllerProvider = StateNotifierProvider<WorkspaceController, AsyncValue<void>>((ref) {
  return WorkspaceController(ref);
});
