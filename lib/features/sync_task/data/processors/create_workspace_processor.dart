import 'dart:developer';

import 'package:core_offline/core_offline.dart';
import 'package:core_offline/exceptions/sync_exceptions.dart';
import 'package:dio/dio.dart';

import '../data_sources/local/daos/workspace_dao.dart';

class CreateWorkspaceProcessor implements OutboxActionProcessor {
  final Dio _dio;
  // final ReferenceDao _referenceDao;
  final WorkspaceDao _workspaceDao;

  CreateWorkspaceProcessor(this._dio, this._workspaceDao);

  @override
  // 💡 သင့် Outbox Engine ရဲ့ Map Key နှင့် ကိုက်ညီရန် Action Name သတ်မှတ်ခြင်း
  String get actionType => 'createWorkspace';

  @override
  Future<Map<String, dynamic>?> process(OfflineOutboxItem item) async {
    try {
      final Map<String, dynamic> payload = item.payloadAsMap;

      // 🎯 ၁။ Robust Parsing: String လာလာ၊ int လာလာ စိတ်ချရအောင် ပြောင်းဖတ်မည်
      final int? localId = payload['localId'] != null ? int.tryParse(payload['localId'].toString()) : null;

      final options = Options(headers: {if (item.clientReferenceId != null) 'X-Idempotency-Key': item.clientReferenceId});

      log('🔄 [Sync Engine] Processing Workspace: localId=$localId, payload=$payload');

      final response = await _dio.post(item.url, data: payload, options: options);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data as Map<String, dynamic>;

        if (data['id'] != null) {
          final serverId = data['id'].toString();

          // 🎯 ၂။ ဒေတာအခြေအနေကို စစ်ဆေးပြီး လင့်ချိတ်မည်
          if (localId != null && localId != 0) {
            await _workspaceDao.updateServerId(localId, serverId);
            log('🎯 [Dual-ID] Successfully linked Workspace Local ID: $localId to Server ID: $serverId');
          } else {
            // 🚨 ဤနေရာသည် တရားခံကို ဖမ်းမိမည့်နေရာ ဖြစ်သည်
            log('⚠️ [Sync Warning] Workspace ဆာဗာပေါ်ရောက်သွားသော်လည်း Outbox Payload ထဲတွင် "localId" ပါမလာသောကြောင့် (သို့မဟုတ် 0 ဖြစ်နေ၍) Local DB ကို Update မလုပ်နိုင်ခဲ့ပါ။');
          }
        }

        return data;
      }

      // ဆာဗာဘက်က Error Response ပြန်လာလျှင်
      if (response.statusCode != null && response.statusCode! >= 500) {
        throw SyncServerException(response.statusMessage ?? "Server Error"); // 👈 သင့် Engine မှ catch လုပ်မည့် Exception
      } else if (response.statusCode == 409) {
        throw SyncConflictException(response.statusMessage ?? "Conflict Error"); // 👈 ဒေတာထပ်နေလျှင်
      } else if (response.statusCode != null && response.statusCode! >= 400 && response.statusCode! < 500) {
        throw Exception("Client Error: ${response.statusCode} - ${response.data}"); // 👈 Retry မလုပ်တော့ဘဲ ရပ်ရန်
      } else {
        throw SyncNetworkException(response.statusMessage ?? "Network Error");
      }
    } on DioException catch (e) {
      // 🚨 [ဒီနေရာက အရေးကြီးဆုံးပါ] Dio Error အသေးစိတ်ကို ကွက်ကွက်ကွင်းကွင်း ထုတ်ကြည့်မည်
      log('❌ [DioException caught in Processor]');
      log('👉 Error Type: ${e.type}');
      log('👉 Error Message: ${e.message}');
      log('👉 Server Response Data: ${e.response?.data}');
      log('👉 Server Response Status: ${e.response?.statusCode}');

      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || (e.message != null && e.message!.contains('SocketException'))) {
        throw SyncNetworkException("Network Error");
      }
      throw SyncServerException("Server Error");
    } catch (e, stackTrace) {
      // 🚨 မျှော်လင့်မထားသော အခြား Error များ (ဥပမာ- Casting Error သို့မဟုတ် Payload Type Error)
      log('💥 [Unexpected Error in Processor]: $e');
      log('📋 StackTrace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<void> onConflict(Object error, OfflineOutboxItem item) async {
    // ⚠️ ဒေတာချင်း တိုက်မိပါက လုပ်ဆောင်မည့် Logic (ဥပမာ- Log ထုတ်ခြင်း သို့မဟုတ် UI Notification ပြရန် ပြင်ဆင်ခြင်း)
    // သင့် Engine ရဲ့ လိုင်းနံပါတ် ၁၅၁ အရ ၎င်းသည် Queue ကို ပိတ်မနေစေဘဲ အလိုအလျောက် unblock လုပ်ပေးမည်
  }

  @override
  Future<void> onFailure(Object error, OfflineOutboxItem item, int currentRetries) async {
    // 🚨 Max Retries ပြည့်သွားသော်လည်း လုံးဝမအောင်မြင်သည့်အခါ နောက်ဆုံးလုပ်ဆောင်မည့်အလုပ်
  }
}
