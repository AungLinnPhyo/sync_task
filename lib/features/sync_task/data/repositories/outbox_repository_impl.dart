import 'package:core_offline/core_offline.dart';
import 'package:core_offline/enums/action_type_enum.dart';
import 'package:core_offline/enums/outbox_status_enum.dart';
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
      actionType: ActionTypeEnum.values.byName(item.actionType), // String to Enum
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
    // pending သို့မဟုတ် failed ဖြစ်ပြီး retry ကျန်သေးသော ပထမဆုံးအကောင်ကို ယူသည်
    final syncable = pendingItems.where((t) => t.status == 'pending' || t.status == 'failed');
    if (syncable.isEmpty) return null;
    return _mapToOfflineItem(syncable.first);
  }

  @override
  Future<void> updateOutboxItem({
    required int id,
    required OutboxStatusEnum status,
    required int retryCount,
    String? lastError,
  }) {
    // သင့် OutboxDao ထဲတွင် update query မရှိသေးပါက ဤကဲ့သို့ တိုက်ရိုက် update ရေးနိုင်သည်
    return (_dao.update(_dao.outboxTable)..where((t) => t.id.equals(id))).write(
      OutboxTableCompanion(
        status: Value(status.name),
        retryCount: Value(retryCount),
        lastError: Value(lastError),
      ),
    );
  }

  @override
  Future<void> deleteOutboxItem(int id) => _dao.deleteItem(id);
}