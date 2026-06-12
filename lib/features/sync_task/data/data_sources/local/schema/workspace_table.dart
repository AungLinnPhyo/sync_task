import 'package:drift/drift.dart';

class WorkspaceTable extends Table {
  TextColumn get id => text()(); // UUID သို့မဟုတ် Server ID ဝင်နိုင်ရန် String ထားသည်
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}