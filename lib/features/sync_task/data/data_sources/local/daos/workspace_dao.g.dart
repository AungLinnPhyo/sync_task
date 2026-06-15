// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_dao.dart';

// ignore_for_file: type=lint
mixin _$WorkspaceDaoMixin on DatabaseAccessor<AppDatabase> {
  $WorkspaceTableTable get workspaceTable => attachedDatabase.workspaceTable;
  WorkspaceDaoManager get managers => WorkspaceDaoManager(this);
}

class WorkspaceDaoManager {
  final _$WorkspaceDaoMixin _db;
  WorkspaceDaoManager(this._db);
  $$WorkspaceTableTableTableManager get workspaceTable =>
      $$WorkspaceTableTableTableManager(
        _db.attachedDatabase,
        _db.workspaceTable,
      );
}
