import 'package:drift/drift.dart';

class TaskTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get projectId => text()(); // Parent Table ၏ ID
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}