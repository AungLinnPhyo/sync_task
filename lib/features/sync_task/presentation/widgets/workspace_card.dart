import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/project_provider.dart';

class WorkspaceCard extends ConsumerStatefulWidget {
  final dynamic workspace; // WorkspaceEntity
  const WorkspaceCard({required this.workspace, super.key});

  @override
  ConsumerState<WorkspaceCard> createState() => _WorkspaceCardState();
}

class _WorkspaceCardState extends ConsumerState<WorkspaceCard> {
  late TextEditingController _txtProjectName;

  @override
  void initState() {
    super.initState();
    _txtProjectName = TextEditingController();
  }

  @override
  void dispose() {
    _txtProjectName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectsAsync = ref.watch(projectsStreamProvider(widget.workspace.id));

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Workspace အချက်အလက်
            Text('📦 Workspace: ${widget.workspace.name}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('ID: ${widget.workspace.id}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const Divider(),

            // ၎င်း Workspace အောက်ရှိ ပရိုဂျက်များစာရင်း
            projectsAsync.when(
              data: (projects) {
                return Column(
                  children: projects
                      .map(
                        (project) => ListTile(
                          dense: true,
                          title: Text('🚀 Project: ${project.name}'),
                          subtitle: Text('ID: ${project.id} \nParent (Workspace ID): ${project.workspaceId}', style: const TextStyle(fontSize: 10)),
                        ),
                      )
                      .toList(),
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Error loading projects: $e'),
            ),

            // ပရိုဂျက်အသစ် ထည့်ရန် Textfield နှင့် ခလုတ်
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _txtProjectName,
                    decoration: const InputDecoration(hintText: 'New Project Name', isDense: true),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.teal),
                  onPressed: () {
                    if (_txtProjectName.text.isNotEmpty) {
                      ref.read(projectControllerProvider.notifier).addProject(_txtProjectName.text.trim(), widget.workspace.id);
                      _txtProjectName.clear();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
