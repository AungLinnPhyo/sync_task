import 'dart:convert';

import 'package:core_offline/core_offline.dart';
import 'package:core_offline/exceptions/sync_exceptions.dart';
import 'package:dio/dio.dart';

class UpdateWorkspaceProcessor extends OutboxActionProcessor {
  final Dio _dio;

  UpdateWorkspaceProcessor(this._dio);
  
  @override
  // 🎯 အင်ဂျင်က ဘယ်အလုပ်ကို ဖမ်းမောင်းရမလဲဆိုတာ ဒီ String နဲ့ သိမှာဖြစ်ပါတယ်
  String get actionType => "updateWorkspace";

  @override
  Future<void> onConflict(Object error, OfflineOutboxItem item) {
    // TODO: implement onConflict
    throw UnimplementedError();
  }

  @override
  Future<void> onFailure(Object error, OfflineOutboxItem item, int currentRetries) {
    // TODO: implement onFailure
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> process(OfflineOutboxItem item) async {
    try {
      // ၁။ Payload JSON String အား Map အဖြစ် ပြန်ပြောင်းခြင်း
      final Map<String, dynamic> data = jsonDecode(item.payload);

      // ၂။ ဆာဗာဆီသို့ PUT Request ဖြင့် အပ်ဒိတ်ဒေတာ လှမ်းပို့ခြင်း
      final response = await _dio.put(
        item.url, 
        data: data,
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      }
      return null;
    } on DioException catch (e) {
      // သင့်အင်ဂျင်က နားလည်မည့် ရိုက်ခတ်မှု Error များအဖြစ် ပြန်ပြောင်းပေးခြင်း
      if (e.response?.statusCode == 409) {
        throw SyncConflictException('Conflict on server: ${e.message}');
      }
      throw SyncNetworkException('Network error updating workspace: ${e.message}');
    } catch (e) {
      throw SyncServerException('Fatal error in update processor: $e');
    }
  }
  
}