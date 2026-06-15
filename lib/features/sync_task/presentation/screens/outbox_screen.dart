import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/dependency_injection/dependency_injections.dart';
import '../providers/outbox_provider.dart';

class OutboxScreen extends ConsumerWidget {
  const OutboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outboxAsync = ref.watch(outboxItemsStreamProvider);
    final syncEngine = ref.read(offlineSyncEngineProvider); // Sync Engine နိုးရန်

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Outbox Queue'),
        actions: [
          // 🔄 Manual Sync လုပ်မည့် ခလုတ်
          IconButton(
            icon: const Icon(Icons.sync, color: Colors.blue),
            tooltip: 'Force Sync Now',
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('🔄 Force sync triggered...')));
              await syncEngine.triggerSync();
            },
          ),
        ],
      ),
      body: outboxAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_done, size: 64, color: Colors.green),
                  SizedBox(height: 16),
                  Text('All data synced successfully!'),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: _getStatusIcon(item.status.name),
                  title: Text(item.actionType.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('URL: ${item.url}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('Payload: ${item.payload}', maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(
                        // 'Created: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(item.createdAt)}',
                        'Created: ${item.createdAt}',
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                  trailing: _getStatusChip(item.status.name),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('❌ Error loading outbox: $err')),
      ),
    );
  }

  // 🎨 Status အလိုက် Icon လေးများ သတ်မှတ်ခြင်း
  Widget _getStatusIcon(String status) {
    switch (status) {
      case 'syncing':
        return const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5));
      case 'error':
        return const Icon(Icons.sync_problem, color: Colors.orange);
      case 'failed':
        return const Icon(Icons.error_outline, color: Colors.red);
      case 'pending':
      default:
        return const Icon(Icons.cloud_queue, color: Colors.grey);
    }
  }

  // 🎨 Status အလိုက် အရောင်ကွဲ Chip လေးများ ပြသခြင်း
  Widget _getStatusChip(String status) {
    Color color;
    switch (status) {
      case 'syncing':
        color = Colors.blue;
        break;
      case 'error':
        color = Colors.orange;
        break;
      case 'failed':
        color = Colors.red;
        break;
      case 'pending':
      default:
        color = Colors.grey;
        break;
    }

    return Chip(
      label: Text(status.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 10)),
      backgroundColor: color,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
