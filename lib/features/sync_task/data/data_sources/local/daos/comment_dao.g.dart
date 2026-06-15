// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dao.dart';

// ignore_for_file: type=lint
mixin _$CommentDaoMixin on DatabaseAccessor<AppDatabase> {
  $CommentTableTable get commentTable => attachedDatabase.commentTable;
  CommentDaoManager get managers => CommentDaoManager(this);
}

class CommentDaoManager {
  final _$CommentDaoMixin _db;
  CommentDaoManager(this._db);
  $$CommentTableTableTableManager get commentTable =>
      $$CommentTableTableTableManager(_db.attachedDatabase, _db.commentTable);
}
