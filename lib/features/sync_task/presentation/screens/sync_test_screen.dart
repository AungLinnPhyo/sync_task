import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/workspace_provider.dart';
import '../widgets/workspace_card.dart';

class SyncTestScreen extends ConsumerWidget {
  const SyncTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspacesAsync = ref.watch(workspacesStreamProvider);
    final workspaceController = ref.watch(workspaceControllerProvider);
    final txtWorkspaceName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🔌 Offline Sync Tester'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // === ဝပ်စပေ့စ်အသစ် ဆောက်သည့်အပိုင်း ===
            Card(
              color: Colors.teal.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: txtWorkspaceName,
                        decoration: const InputDecoration(
                          hintText: 'Enter Workspace Name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    workspaceController.maybeWhen(
                      loading: () => const CircularProgressIndicator(),
                      orElse: () => ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('Add Workspace'),
                        onPressed: () {
                          if (txtWorkspaceName.text.isNotEmpty) {
                            ref.read(workspaceControllerProvider.notifier)
                               .addWorkspace(txtWorkspaceName.text.trim());
                            txtWorkspaceName.clear();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Workspaces & Projects List:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 8),
            
            // === ဒေတာစာရင်းများအား Stream ဖြင့် ပြသသည့်အပိုင်း ===
            Expanded(
              child: workspacesAsync.when(
                data: (workspaces) {
                  if (workspaces.isEmpty) {
                    return const Center(child: Text('No data. Try adding one offline!'));
                  }
                  return ListView.builder(
                    itemCount: workspaces.length,
                    itemBuilder: (context, index) {
                      final workspace = workspaces[index];
                      return WorkspaceCard(workspace: workspace);
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ဝပ်စပေ့စ်ကတ်ပြားတစ်ခုချင်းစီအတွက် Sub-Widget
