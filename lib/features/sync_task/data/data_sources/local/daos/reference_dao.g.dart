// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_dao.dart';

// ignore_for_file: type=lint
mixin _$ReferenceDaoMixin on DatabaseAccessor<AppDatabase> {
  $ReferenceTableTable get referenceTable => attachedDatabase.referenceTable;
  ReferenceDaoManager get managers => ReferenceDaoManager(this);
}

class ReferenceDaoManager {
  final _$ReferenceDaoMixin _db;
  ReferenceDaoManager(this._db);
  $$ReferenceTableTableTableManager get referenceTable =>
      $$ReferenceTableTableTableManager(
        _db.attachedDatabase,
        _db.referenceTable,
      );
}
