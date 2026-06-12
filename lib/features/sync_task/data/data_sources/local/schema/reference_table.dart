import 'package:drift/drift.dart';

class ReferenceTable extends Table {
  TextColumn get clientId => text()(); // Temporary UI UUID
  TextColumn get serverId => text()(); // Real Server Database ID

  @override
  Set<Column> get primaryKey => {clientId};
}