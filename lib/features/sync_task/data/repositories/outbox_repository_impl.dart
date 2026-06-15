import 'dart:math';

import 'package:core_offline/core_offline.dart';
// import 'package:core_offline/enums/action_type_enum.dart';
// import 'package:core_offline/enums/outbox_status_enum.dart';
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../data_sources/local/daos/outbox_dao.dart';

class OutboxRepositoryImpl implements OfflineOutboxRepository {
  final OutboxDao _dao;

  OutboxRepositoryImpl(this._dao);

  // Drift Data မှ Core Offline Item သို့ ပြောင်းလဲပေးသည့် Helper

  OfflineOutboxItem _mapToOfflineItem(OutboxTableData item) {
    return OfflineOutboxItem(
      id: item.id,
      url: item.url,
      method: item.method,
      // actionType: ActionTypeEnum.values.byName(item.actionType), // String to Enum
      actionType: item.actionType,
      payload: item.payload,
      retryCount: item.retryCount,
      clientReferenceId: item.clientReferenceId,
      maxRetries: 3, // စိတ်ကြိုက် သတ်မှတ်နိုင်သည်
      status: OutboxStatusEnum.values.byName(item.status), // String to Enum
      lastError: item.lastError,
      createdAt: item.createdAt,
    );
  }

  @override
  Stream<List<OfflineOutboxItem>> watchOutbox() {
    return _dao.watchOutbox().map((list) => list.map(_mapToOfflineItem).toList());
  }

  @override
  Future<OfflineOutboxItem?> getNextSyncableItem() async {
    final pendingItems = await _dao.getAllPending();

    const maxRetries = 3; // 🎯 သင့် Config ထဲက အမြင့်ဆုံး စမ်းသပ်မည့်အကြိမ်ရေ

    final syncable = pendingItems.where((t) {
      // ၁။ Status သည် pending သို့မဟုတ် failed ဖြစ်ရမည်
      if (t.status != 'pending' && t.status != 'failed') return false;

      final retryCount = t.retryCount;

      // ၂။ 🚨 [အရေးကြီးဆုံး] Max Retries ပြည့်သွားပါက လုံးဝ ကျော်ပစ်မည် (ဒါက Infinite Loop ကို တားပေးပါသည်)
      if (retryCount >= maxRetries) return false;

      // ၃။ ⏳ [Delay စစ်ခြင်း] အကယ်၍ failed ဖြစ်ဖူးပါက တင်ထားသော Delay အချိန်ပြည့်မှသာ ပြန်လုပ်ခွင့်ပေးမည်
      if (t.status == 'failed' && retryCount > 0) {
        // duration_extension.dart ထဲက formula အတိုင်း လက်ရှိ retryCount အလိုက် Delay စက္ကန့်ကို တွက်ချက်ခြင်း
        int seconds = 5 * pow(6, retryCount).toInt();
        if (seconds > 3600) seconds = 3600; // Max Delay ကို ၁ နာရီထက် မကျော်စေရန်
        final delayDuration = Duration(seconds: seconds);

        // နောက်ဆုံး Update ဖြစ်ခဲ့တဲ့ အချိန်ကနေ အခုအချိန်ထိ ကြာသွားတဲ့ သက်တမ်းကို တွက်ချက်ခြင်း
        final lastActiveTime = t.createdAt;
        final timePassed = DateTime.now().difference(lastActiveTime);

        // 💡 သတ်မှတ်ထားသော Delay ကြာချိန်ထက် မပြည့်သေးပါက ဤ Item ကို ခဏ ကျော်ထားမည်
        if (timePassed < delayDuration) return false;
      }

      return true;
    });

    if (syncable.isEmpty) return null;

    // စည်းကမ်းချက်များနှင့် ကိုက်ညီသော (အချိန်ပြည့်ပြီဖြစ်သော) ပထမဆုံး Item အား ပို့ပေးမည်
    return _mapToOfflineItem(syncable.first);
  }

  @override
  Future<void> updateOutboxItem({required int id, required OutboxStatusEnum status, required int retryCount, String? lastError}) {
    // သင့် OutboxDao ထဲတွင် update query မရှိသေးပါက ဤကဲ့သို့ တိုက်ရိုက် update ရေးနိုင်သည်
    return (_dao.update(_dao.outboxTable)..where((t) => t.id.equals(id))).write(OutboxTableCompanion(status: Value(status.name), retryCount: Value(retryCount), lastError: Value(lastError)));
  }

  @override
  Future<void> deleteOutboxItem(int id) => _dao.deleteItem(id);
}
