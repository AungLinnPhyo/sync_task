// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dao.dart';

// ignore_for_file: type=lint
mixin _$ProjectDaoMixin on DatabaseAccessor<AppDatabase> {
  $WorkspaceTableTable get workspaceTable => attachedDatabase.workspaceTable;
  $ProjectTableTable get projectTable => attachedDatabase.projectTable;
  ProjectDaoManager get managers => ProjectDaoManager(this);
}

class ProjectDaoManager {
  final _$ProjectDaoMixin _db;
  ProjectDaoManager(this._db);
  $$WorkspaceTableTableTableManager get workspaceTable =>
      $$WorkspaceTableTableTableManager(
        _db.attachedDatabase,
        _db.workspaceTable,
      );
  $$ProjectTableTableTableManager get projectTable =>
      $$ProjectTableTableTableManager(_db.attachedDatabase, _db.projectTable);
}
