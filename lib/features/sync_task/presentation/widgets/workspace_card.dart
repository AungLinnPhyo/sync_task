import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/workspace_entity.dart';
import '../providers/project_provider.dart';

class WorkspaceCard extends ConsumerStatefulWidget {
  final WorkspaceEntity workspace;
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
    final projectsAsync = ref.watch(projectsStreamProvider(widget.workspace.localId.toString()));

    

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
            Text('ID: ${widget.workspace.serverId ?? widget.workspace.localId}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const Divider(),

            // ၁။ ၎င်း Workspace အောက်ရှိ ပရိုဂျက်များစာရင်း (Project List)
            projectsAsync.when(
              data: (projects) {
                if (projects.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "No projects yet",
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                    ),
                  );
                }
                return Column(
                  children: projects
                      .map(
                        (project) => ListTile(
                          dense: true,
                          title: Text('🚀 Project: ${project.name}'),
                          subtitle: Text('ID: ${project.serverId ?? project.localId} \nLocal Parent ID: ${project.localWorkspaceId}', style: const TextStyle(fontSize: 10)),
                        ),
                      )
                      .toList(),
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Error loading projects: $e'),
            ),

            // ၂။ ပရိုဂျက်အသစ် ထည့်ရန် Textfield (Add Project UI)
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
                      ref.read(projectControllerProvider.notifier).addProject(_txtProjectName.text.trim(), widget.workspace.localId);
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
