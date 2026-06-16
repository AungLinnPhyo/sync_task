import 'package:drift/drift.dart';

import 'workspace_table.dart';

class ProjectTable extends Table {
  // 🏠 ဖုန်းထဲက သီးသန့် Primary Key (Auto-increment Integer)
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  // 🎯 Workspace နှင့် ချိတ်ဆက်မှုကို ဖုန်းထဲက Local ID နှင့်သာ တိုက်ရိုက်ချိတ်မည်
  IntColumn get workspaceId => integer().references(WorkspaceTable, #id)();
  // 🌐 ဆာဗာကပေးမည့် Project ID (အော့ဖ်လိုင်းတုန်းက null ဖြစ်နေပြီး Sync အောင်မှ ဝင်မည်)
  TextColumn get serverId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
