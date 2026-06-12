import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../database/app_database.dart';

/// ⚡ ၁။ Network Client Provider (Mock Server ဆီ ချိတ်ဆက်ရန်)
final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'http://10.0.2.2:3000', // Node.js Local Server Address
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
});

/// ⚡ ၂။ Local Relational Database Provider (Singleton)
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close()); // DB Leak မဖြစ်အောင် ပိတ်သိမ်းခြင်း
  return db;
});