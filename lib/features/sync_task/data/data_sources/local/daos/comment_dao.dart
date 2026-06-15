import 'package:drift/drift.dart';
import '../../../../../../core/database/app_database.dart';
import '../schema/comment_table.dart';

part 'comment_dao.g.dart';

@DriftAccessor(tables: [CommentTable])
class CommentDao extends DatabaseAccessor<AppDatabase> with _$CommentDaoMixin {
  CommentDao(super.db);

  Stream<List<CommentTableData>> watchCommentsForTask(String taskId) {
    return (select(commentTable)..where((t) => t.taskId.equals(taskId))).watch();
  }

  Future<void> insertComment(CommentTableCompanion comment) => into(commentTable).insert(comment);

  Future<void> deleteComment(String id) => (delete(commentTable)..where((t) => t.id.equals(id))).go();
}
