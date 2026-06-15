import 'package:drift/drift.dart';
import '../../../../../../core/database/app_database.dart';
import '../schema/task_table.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  Stream<List<TaskTableData>> watchTasksByProject(String projectId) {
    return (select(taskTable)..where((t) => t.projectId.equals(projectId))).watch();
  }

  Future<void> insertTask(TaskTableCompanion task) => into(taskTable).insertOnConflictUpdate(task);

  Future<void> deleteTask(String id) => (delete(taskTable)..where((t) => t.id.equals(id))).go();

  Future<void> clearAll() => delete(taskTable).go();
}
