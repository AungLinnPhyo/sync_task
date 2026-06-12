import 'package:drift/drift.dart';

class ProjectTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get workspaceId => text()(); // Parent Table ၏ ID အား ချိတ်ဆက်ခြင်း
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}