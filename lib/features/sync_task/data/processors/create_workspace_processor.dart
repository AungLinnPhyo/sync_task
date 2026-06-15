import 'package:core_offline/core_offline.dart';
import 'package:core_offline/exceptions/sync_exceptions.dart';
import 'package:dio/dio.dart';

import '../data_sources/local/daos/reference_dao.dart';

class CreateWorkspaceProcessor implements OutboxActionProcessor {
  final Dio _dio;
  final ReferenceDao _referenceDao;

  CreateWorkspaceProcessor(this._dio, this._referenceDao);

  @override
  // 💡 သင့် Outbox Engine ရဲ့ Map Key နှင့် ကိုက်ညီရန် Action Name သတ်မှတ်ခြင်း
  String get actionType => 'createWorkspace';

  @override
  Future<Map<String, dynamic>?> process(OfflineOutboxItem item) async {
    try {
      // 🎯 Template ထဲမှ payloadAsMap helper အား သုံးထားသည်
      final Map<String, dynamic> payload = item.payloadAsMap;

      final options = Options(headers: {if (item.clientReferenceId != null) 'X-Idempotency-Key': item.clientReferenceId});

      // Node.js Local Server သို့ လှမ်းပို့ခြင်း
      final response = await _dio.post(
        item.url, // '/api/workspaces'
        data: payload,
        options: options,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as Map<String, dynamic>;
        // 💡 ဆာဗာ ID နှင့် UUID Mapping ကို Engine ထဲက လိုင်းနံပါတ် ၁၃၈ မှာ အလိုအလျောက် မှတ်ပေးသွားမှာ ဖြစ်လို့
        // ဒီနေရာမှာ သီးသန့် saveMapping ထပ်ရေးစရာ မလိုတော့ပါဘူး။ အလွန်ကောင်းမွန်တဲ့ Engine logic ပါဗျာ။
      }

      // ဆာဗာဘက်က Error Response ပြန်လာလျှင်
      if (response.statusCode != null && response.statusCode! >= 500) {
        throw SyncServerException(response.statusMessage ?? "Server Error"); // 👈 သင့် Engine မှ catch လုပ်မည့် Exception
      } else if (response.statusCode == 409) {
        throw SyncConflictException(response.statusMessage ?? "Conflict Error"); // 👈 ဒေတာထပ်နေလျှင်
      } else {
        throw SyncNetworkException(response.statusMessage ?? "Network Error");
      }
    } on DioException catch (e) {
      // Network လိုင်း လုံးဝမရှိခြင်း သို့မဟုတ် Timeout ဖြစ်ခြင်းများအတွက်
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.message!.contains('SocketException')) {
        throw SyncNetworkException("Network Error"); // 👈 Engine မှ Exponential Delay ဖြင့် ထပ်မံကြိုးစားရန်
      }
      throw SyncServerException("Server Error");
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
