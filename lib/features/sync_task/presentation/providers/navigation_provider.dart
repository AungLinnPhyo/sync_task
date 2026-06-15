import 'package:flutter_riverpod/legacy.dart';

/// Provider to track the current active index of the BottomNavigationBar
final navigationIndexProvider = StateProvider<int>((ref) {
  return 0; // Default to the first tab (Sync Tester)
});
