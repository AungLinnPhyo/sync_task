import 'package:drift/drift.dart';

class WorkspaceTable extends Table {
  // 🏠 ဖုန်းထဲက သီးသန့် Primary Key (Auto-increment Integer)
  IntColumn get id => integer().autoIncrement()();
  // 🌐 ဆာဗာကပေးမည့် Project ID (အော့ဖ်လိုင်းတုန်းက null ဖြစ်နေပြီး Sync အောင်မှ ဝင်မည်)
  TextColumn get serverId => text().nullable()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}