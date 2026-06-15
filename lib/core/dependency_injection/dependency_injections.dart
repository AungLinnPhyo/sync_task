import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core_offline/core_offline.dart';
import 'package:synctask/features/sync_task/domain/usecases/workspace_usecase.dart';

import '../../features/sync_task/data/data_sources/local/daos/outbox_dao.dart';
import '../../features/sync_task/data/data_sources/local/daos/project_dao.dart';
import '../../features/sync_task/data/data_sources/local/daos/reference_dao.dart';
import '../../features/sync_task/data/data_sources/local/daos/workspace_dao.dart';
import '../../features/sync_task/data/repositories/outbox_repository_impl.dart';
import '../../features/sync_task/data/repositories/reference_repository_impl.dart';
import '../../features/sync_task/domain/repositories/worksapce_repository.dart';
import '../../features/sync_task/domain/usecases/project_usecase.dart';
import '../database/app_database.dart';
import '../../features/sync_task/data/processors/create_project_processor.dart';
import '../../features/sync_task/data/processors/create_workspace_processor.dart';
import '../../features/sync_task/data/repositories/project_repository_impl.dart';
import '../../features/sync_task/data/repositories/workspace_repository_impl.dart';
import '../../features/sync_task/domain/repositories/project_repository.dart';

// 1. External Infrastructure Providers
final dioProvider = Provider<Dio>((ref) => Dio());
final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());
final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

// 2. Local DAOs Providers
final workspaceDaoProvider = Provider<WorkspaceDao>((ref) => WorkspaceDao(ref.watch(databaseProvider)));
final projectDaoProvider = Provider<ProjectDao>((ref) => ProjectDao(ref.watch(databaseProvider)));
final outboxDaoProvider = Provider<OutboxDao>((ref) => OutboxDao(ref.watch(databaseProvider)));
final referenceDaoProvider = Provider<ReferenceDao>((ref) => ReferenceDao(ref.watch(databaseProvider)));

// 3. Core Offline Repositories Providers
final localReferenceRepositoryProvider = Provider<LocalReferenceRepository>((ref) {
  return ReferenceRepositoryImpl(ref.watch(referenceDaoProvider));
});
final offlineOutboxRepositoryProvider = Provider<OfflineOutboxRepository>((ref) {
  return OutboxRepositoryImpl(ref.watch(outboxDaoProvider));
});

// 4. Feature Domain Repositories Providers
final workspaceRepositoryProvider = Provider<WorkspaceRepository>((ref) {
  return WorkspaceRepositoryImpl(ref.watch(workspaceDaoProvider), ref.watch(outboxDaoProvider));
});
final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return ProjectRepositoryImpl(ref.watch(projectDaoProvider), ref.watch(outboxDaoProvider));
});

// 5. Sync Processors Providers
final createWorkspaceProcessorProvider = Provider<CreateWorkspaceProcessor>((ref) {
  return CreateWorkspaceProcessor(ref.watch(dioProvider), ref.watch(referenceDaoProvider));
});
final createProjectProcessorProvider = Provider<CreateProjectProcessor>((ref) {
  return CreateProjectProcessor(ref.watch(dioProvider), ref.watch(referenceDaoProvider));
});

// 🚀 6. Central Offline Sync Engine Provider
final offlineSyncEngineProvider = Provider<OfflineSyncEngine>((ref) {
  final engine = OfflineSyncEngine(
    outboxRepository: ref.watch(offlineOutboxRepositoryProvider),
    referenceRepository: ref.watch(localReferenceRepositoryProvider),
    config: const SyncConfig(maxRetries: 3),
    connectivity: ref.watch(connectivityProvider),
  );

  // Processors များကို Engine ထဲသို့ Register သွင်းခြင်း
  engine.registerProcessor(ref.watch(createWorkspaceProcessorProvider));
  engine.registerProcessor(ref.watch(createProjectProcessorProvider));

  return engine;
});

// === Consolidated Use Cases Providers ===

// Workspace အတွက် Use Case Provider
final workspaceUsecaseProvider = Provider<WorkspaceUsecase>((ref) {
  return WorkspaceUsecase(ref.watch(workspaceRepositoryProvider));
});

// Project အတွက် Use Case Provider
final projectUsecaseProvider = Provider<ProjectUsecase>((ref) {
  return ProjectUsecase(ref.watch(projectRepositoryProvider));
});
