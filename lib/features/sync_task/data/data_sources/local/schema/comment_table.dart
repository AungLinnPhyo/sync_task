import 'package:drift/drift.dart';

class CommentTable extends Table {
  TextColumn get id => text()();
  TextColumn get textContent => text()();
  TextColumn get taskId => text()(); // Parent Table ၏ ID
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}