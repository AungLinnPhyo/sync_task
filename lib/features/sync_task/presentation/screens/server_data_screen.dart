import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/workspace_provider.dart';
import '../widgets/workspace_card.dart';

class ServerDataScreen extends ConsumerWidget {
  const ServerDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspacesAsync = ref.watch(workspacesStreamProvider);
    final workspaceController = ref.watch(workspaceControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('🌐 Server Data Cache'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          workspaceController.maybeWhen(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
              ),
            ),
            orElse: () => IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Fetch from Server',
              onPressed: () {
                ref.read(workspaceControllerProvider.notifier).refreshFromServer();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fetching latest data from server...')));
              },
            ),
          ),
        ],
      ),
      body: workspacesAsync.when(
        data: (workspaces) {
          if (workspaces.isEmpty) {
            return const Center(child: Text('No data found in local cache.\nTap refresh to fetch from server.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: workspaces.length,
            itemBuilder: (context, index) {
              final workspace = workspaces[index];
              // Reusing WorkspaceCard to show Projects automatically
              return WorkspaceCard(workspace: workspace);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('❌ Error: $err')),
      ),
    );
  }
}
