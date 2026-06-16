import 'dart:developer';
import 'package:core_offline/core_offline.dart';
import 'package:core_offline/exceptions/sync_exceptions.dart';
import 'package:dio/dio.dart';
import '../data_sources/local/daos/project_dao.dart';
import '../data_sources/local/daos/workspace_dao.dart';

class CreateProjectProcessor implements OutboxActionProcessor {
  final Dio _dio;
  final WorkspaceDao _workspaceDao;
  final ProjectDao _projectDao;

  CreateProjectProcessor(this._dio, this._workspaceDao, this._projectDao);

  @override
  String get actionType => 'createProject';

  @override
  Future<Map<String, dynamic>?> process(OfflineOutboxItem item) async {
    try {
      final Map<String, dynamic> payload = item.payloadAsMap;

      final int localId = int.tryParse(payload['localId'].toString()) ?? 0;
      final int localWorkspaceId = int.tryParse(payload['localWorkspaceId'].toString()) ?? 0;
      final String name = payload['name']?.toString() ?? '';

      log('🔄 [Sync Engine] Processing Project: localId=$localId, name=$name');

      // ၁။ Workspace ၏ Server ID အစစ်ကို ရှာသည်
      final parentWorkspace = await _workspaceDao.getWorkspaceById(localWorkspaceId);
      final String? serverWorkspaceId = parentWorkspace?.serverId;

      if (serverWorkspaceId == null) {
        log('⏳ [Sync Dependency] Parent Workspace (Local ID: $localWorkspaceId) server ID not found yet. Retrying later...');
        throw SyncNetworkException("Parent Workspace server ID not found yet. Retrying later...");
      }

      final options = Options(headers: {
        if (item.clientReferenceId != null) 'X-Idempotency-Key': item.clientReferenceId
      });

      // ၂။ ဆာဗာဆီသို့ ပို့ဆောင်ခြင်း
      final response = await _dio.post(
        item.url,
        data: {
          "workspaceId": int.tryParse(serverWorkspaceId) ?? serverWorkspaceId,
          "name": name,
        },
        options: options,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        if (data['id'] != null) {
          final serverProjectId = data['id'].toString();
          await _projectDao.updateServerId(localId, serverProjectId);
          log('🎯 [Dual-ID] Linked Project Local ID: $localId to Server ID: $serverProjectId');
        }
        return data;
      }

      // Server Error handling
      if (response.statusCode != null && response.statusCode! >= 500) {
        throw SyncServerException("Server Error: ${response.statusCode}");
      } else if (response.statusCode == 409) {
        throw SyncConflictException("Conflict Error: ${response.statusCode}");
      } else {
        throw SyncNetworkException("Network Error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      // 🚨 [ဒီနေရာက အခုအသစ်ဖြည့်လိုက်သော အရေးကြီးဆုံးအပိုင်းဖြစ်သည်]
      log('❌ [DioException caught in Project Processor]');
      log('👉 Target URL: ${item.url}');
      log('👉 Error Type: ${e.type}');
      log('👉 Error Message: ${e.message}');
      log('👉 Server Response Data: ${e.response?.data}');
      log('👉 Server Response Status: ${e.response?.statusCode}');

      if (e.type == DioExceptionType.connectionTimeout || 
          e.type == DioExceptionType.receiveTimeout || 
          (e.message != null && e.message!.contains('SocketException'))) {
        throw SyncNetworkException("Network Error"); 
      }
      throw SyncServerException("Dio Server Error: $e");
    } catch (e, stackTrace) {
      log('❌ [Fatal Error] CreateProjectProcessor တွင် မထင်မှတ်ထားသော အမှားဖြစ်ပွားပါသည်: $e', stackTrace: stackTrace);
      if (e is SyncNetworkException || e is SyncServerException || e is SyncConflictException) {
        rethrow;
      }
      throw SyncServerException("Internal Processor Crash: $e");
    }
  }

  @override
  Future<void> onConflict(Object error, OfflineOutboxItem item) async {}
  @override
  Future<void> onFailure(Object error, OfflineOutboxItem item, int currentRetries) async {}
}