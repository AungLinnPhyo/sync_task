import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/dependency_injection/dependency_injections.dart';
import 'features/sync_task/presentation/screens/sync_test_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Riverpod ရဲ့ Container ကို တည်ဆောက်သည်
  final container = ProviderContainer();

  // 🎯 App စတင်သည်နှင့် di/di_providers.dart ထဲက အော့ဖ်လိုင်းဆင့်အင်ဂျင်ကြီးအား စတင်မောင်းနှင်လိုက်ခြင်း
  container.read(offlineSyncEngineProvider);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SyncTestScreen(),
    );
  }
}