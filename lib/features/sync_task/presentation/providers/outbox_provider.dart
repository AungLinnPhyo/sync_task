import 'package:core_offline/core_offline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/dependency_injection/dependency_injections.dart'; // သင့် DI Path

// 🔄 Outbox ထဲက Queue တွေကို စောင့်ကြည့်မည့် Stream Provider
final outboxItemsStreamProvider = StreamProvider<List<OfflineOutboxItem>>((ref) {
  final repository = ref.watch(offlineOutboxRepositoryProvider);
  return repository.watchOutbox();
});
