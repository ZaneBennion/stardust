import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_state.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<void> _pickDirectory(WidgetRef ref) async {
    final selectedDirectory = await getDirectoryPath();
    if (selectedDirectory != null) {
      ref.read(appStateProvider.notifier).setSelectedDirectory(selectedDirectory);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDirectory = ref.watch(
      appStateProvider.select((state) => state.selectedDirectory),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickDirectory(ref),
              icon: const Icon(Icons.folder_open),
              label: const Text('Select Folder'),
            ),
            const SizedBox(height: 16),
            Text(
              selectedDirectory != null
                  ? 'Selected Folder: $selectedDirectory'
                  : 'No folder selected',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
