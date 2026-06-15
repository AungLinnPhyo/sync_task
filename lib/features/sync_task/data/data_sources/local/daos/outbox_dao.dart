// lib/features/sync_task/data/local/daos/outbox_dao.dart
import 'package:drift/drift.dart';

import '../../../../../../core/database/app_database.dart';
import '../schema/outbox_table.dart';

part 'outbox_dao.g.dart';

@DriftAccessor(tables: [OutboxTable])
class OutboxDao extends DatabaseAccessor<AppDatabase> with _$OutboxDaoMixin {
  OutboxDao(super.db);

  // ပို့ရန်ကျန်နေသော အလုပ်များကို စောင့်ကြည့်ရန်
  Stream<List<OutboxTableData>> watchOutbox() {
    return select(outboxTable).watch();
  }

  Future<List<OutboxTableData>> getAllPending() => select(outboxTable).get();

  Future<int> insertItem(OutboxTableCompanion item) => into(outboxTable).insert(item);

  // အလုပ်တစ်ခုကို ဖျက်ရန်
  Future<void> deleteItem(int id) {
    return (delete(outboxTable)..where((t) => t.id.equals(id))).go();
  }
}
