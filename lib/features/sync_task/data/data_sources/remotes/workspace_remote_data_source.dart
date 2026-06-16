import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/workspace_model.dart';

class WorkspaceRemoteDataSource {
  final Dio _dio;

  WorkspaceRemoteDataSource(this._dio);

  // ဆာဗာမှ Workspaces အားလုံးကို Fetch လုပ်ပြီး Model List ပြန်ပေးမည်

  Future<List<WorkspaceModel>> fetchWorkspaces() async {
    try {
      // final response = await _dio.get('http://192.168.1.38:3000/');
      final response = await _dio.get('debug/database');

      if (response.statusCode == 200) {
        dynamic responseData = response.data;
        List<dynamic> list = [];

        log('API Response: $responseData');

        // 💡 Server က List တိုက်ရိုက်မပြန်ဘဲ Map နဲ့ ထုပ်ပေးထားရင် (ဥပမာ- {"workspaces": [...]})
        if (responseData is Map && responseData.containsKey('workspaces')) {
          list = responseData['workspaces'] as List<dynamic>;
        } else if (responseData is List) {
          list = responseData;
        } else {
          log('⚠️ Unexpected API response format: $responseData');
        }

        return list.map((json) => WorkspaceModel.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load workspaces');
      }
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }
}
