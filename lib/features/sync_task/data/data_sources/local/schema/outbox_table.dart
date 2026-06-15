import 'package:drift/drift.dart';

class OutboxTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get action => text()(); // 'CREATE', 'UPDATE', 'DELETE'
  TextColumn get entityType => text()(); // 'TASK', 'PROJECT', etc.
  TextColumn get payload => text()(); // JSON string of the object

  // helps in handling dependencies (e.g., don't sync task before its project)
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  // To prevent multiple attempts on a failing item during a single sync cycle
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
}
