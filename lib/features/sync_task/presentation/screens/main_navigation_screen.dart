import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/navigation_provider.dart';
import 'sync_test_screen.dart';
import 'outbox_screen.dart';

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    // Define the list of screens
    final List<Widget> screens = [const SyncTestScreen(), const OutboxScreen()];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(navigationIndexProvider.notifier).state = index;
        },
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Tester', tooltip: 'Sync Test Screen'),
          BottomNavigationBarItem(icon: Icon(Icons.sync_alt), label: 'Outbox', tooltip: 'Sync Queue Status'),
        ],
      ),
    );
  }
}
