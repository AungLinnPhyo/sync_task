// ဒါက Mapping တွေ သိမ်းဖို့နဲ့ ပြန်ထုတ်ဖို့အတွက်ပါ။

import 'package:drift/drift.dart';

import '../../../../../../core/database/app_database.dart';
import '../schema/reference_table.dart';

part 'reference_dao.g.dart';

@DriftAccessor(tables: [ReferenceTable])
class ReferenceDao extends DatabaseAccessor<AppDatabase> with _$ReferenceDaoMixin {
  ReferenceDao(super.db);

  // Mapping အသစ်တစ်ခု ထည့်ရန် သို့မဟုတ် ရှိပြီးသားကို အစားထိုးရန်
  Future<void> insertMapping(String clientId, String serverId) {
    return into(referenceTable).insertOnConflictUpdate(ReferenceTableCompanion(clientId: Value(clientId), serverId: Value(serverId)));
  }

  // Client ID ပေးလျှင် Server ID ပြန်ထုတ်ရန်
  Future<String?> getServerId(String clientId) async {
    final query = select(referenceTable)..where((t) => t.clientId.equals(clientId));
    final result = await query.getSingleOrNull();
    return result?.serverId;
  }

  Future<void> clearAll() => delete(referenceTable).go();
}
