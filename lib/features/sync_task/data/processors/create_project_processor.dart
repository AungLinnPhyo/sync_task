import 'package:core_offline/core_offline.dart';
import 'package:core_offline/exceptions/sync_exceptions.dart';
import 'package:dio/dio.dart';
import '../data_sources/local/daos/reference_dao.dart';

class CreateProjectProcessor implements OutboxActionProcessor {
  final Dio _dio;
  final ReferenceDao _referenceDao;

  CreateProjectProcessor(this._dio, this._referenceDao);

  @override
  // သင့် Outbox Engine က ခွဲခြားသိမြင်နိုင်ရန် Action Name သတ်မှတ်ခြင်း
  String get actionType => 'createProject';

  @override
  Future<Map<String, dynamic>?> process(OfflineOutboxItem item) async {
    try {
      // 1. သင့် Template ရဲ့ Helper ကိုသုံးပြီး Payload အား ပြုပြင်နိုင်ရန် Map အဖြစ် ယူသည်
      final Map<String, dynamic> payload = item.payloadAsMap;

      // 2. 🎯 Runtime ID Resolution အပိုင်း
      // Payload ထဲတွင် ပါဝင်လာသော workspaceId (ယာယီ UUID ဖြစ်နိုင်ခြေရှိသော ID) အား ထုတ်ယူခြင်း
      final String? currentWorkspaceId = payload['workspaceId']?.toString();

      if (currentWorkspaceId != null) {
        // Mapping Table (ReferenceDao) ထဲတွင် ဤ UUID အတွက် Server ID ရှိ၊ မရှိ စစ်ဆေးသည်
        final String? realServerWorkspaceId = await _referenceDao.getServerId(currentWorkspaceId);

        if (realServerWorkspaceId != null) {
          // 💡 ရှိပါက ဆာဗာသို့ မပို့မီ ယာယီ UUID နေရာတွင် တကယ့် Server ID ဖြင့် အစားထိုးပစ်လိုက်သည်
          payload['workspaceId'] = realServerWorkspaceId;
        }
      }

      // 3. Request Header တွင် Idempotency Key ထည့်သွင်းခြင်း
      final options = Options(
        headers: {
          if (item.clientReferenceId != null) 'X-Idempotency-Key': item.clientReferenceId,
        },
      );

      // 4. Local Server ဆီသို့ လှမ်းပို့ခြင်း
      final response = await _dio.post(
        item.url, // '/api/projects'
        data: payload,
        options: options,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as Map<String, dynamic>;
        // 💡 သင့် Engine ၏ လိုင်းနံပါတ် ၁၃၈ အရ ၎င်းသည် ဤ Project ၏ Real ID ကိုလည်း
        // Mapping Table ထဲသို့ အလိုအလျောက် ထပ်မံသိမ်းဆည်းပေးသွားမည် ဖြစ်သည်။
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
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.message!.contains('SocketException')) {
        throw SyncNetworkException("Network Error"); // Engine မှ Exponential Delay ဖြင့် ပြန်ကြိုးစားရန်
      }
      throw SyncServerException("Server Error: $e");
    }
  }

  @override
  Future<void> onConflict(Object error, OfflineOutboxItem item) async {
    // Conflict ဖြစ်ပါက လုပ်ဆောင်ရန် logic
  }

  @override
  Future<void> onFailure(Object error, OfflineOutboxItem item, int currentRetries) async {
    // လုံးဝ ပို့မရတော့သည့်အခါ လုပ်ဆောင်ရန် logic
  }
}