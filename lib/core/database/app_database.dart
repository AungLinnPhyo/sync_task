import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../features/sync_task/data/data_sources/local/daos/reference_dao.dart';
import '../../features/sync_task/data/data_sources/local/daos/workspace_dao.dart';
import '../../features/sync_task/data/data_sources/local/daos/project_dao.dart';
import '../../features/sync_task/data/data_sources/local/daos/task_dao.dart';
import '../../features/sync_task/data/data_sources/local/daos/comment_dao.dart';
import '../../features/sync_task/data/data_sources/local/daos/outbox_dao.dart';
import '../../features/sync_task/data/data_sources/local/schema/comment_table.dart';
import '../../features/sync_task/data/data_sources/local/schema/project_table.dart';
import '../../features/sync_task/data/data_sources/local/schema/reference_table.dart';
import '../../features/sync_task/data/data_sources/local/schema/task_table.dart';
import '../../features/sync_task/data/data_sources/local/schema/workspace_table.dart';
import '../../features/sync_task/data/data_sources/local/schema/outbox_table.dart';

part 'app_database.g.dart'; // Build Runner မောင်းလျှင် ထွက်လာမည်

@DriftDatabase(tables: [WorkspaceTable, ProjectTable, TaskTable, CommentTable, ReferenceTable, OutboxTable], daos: [ReferenceDao, WorkspaceDao, ProjectDao, TaskDao, CommentDao, OutboxDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'sync_task_production.sqlite'));

    return NativeDatabase.createInBackground(
      file,
      setup: (db) {
        // 💡 Background Isolate နှင့် Foreground UI ပြိုင်တူသုံးနိုင်ရန် WAL Mode အား မဖြစ်မနေ ဖွင့်ရမည်
        db.execute('PRAGMA journal_mode=WAL;');
      },
    );
  });
}
