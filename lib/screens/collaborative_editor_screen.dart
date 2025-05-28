// lib/screens/collaborative_editor_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/collaborative_editor.dart';
import '../providers/providers.dart';

class CollaborativeEditorScreen extends ConsumerWidget {
  const CollaborativeEditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const documentId = 'shared-document-1';
    
    // Generate user IDs for simulation
    final user1Id = ref.watch(userIdProvider('alice'));
    final user2Id = ref.watch(userIdProvider('bob'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Collaborative Notes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => _showInfoDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Instructions
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb,
                      color: Colors.blue[700],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Type in either editor to see real-time collaboration in action! Changes sync instantly between both editors.',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Split view editors
            Expanded(
              child: Row(
                children: [
                  // Editor 1 - Alice
                  Expanded(
                    child: CollaborativeEditor(
                      documentId: documentId,
                      userId: user1Id,
                      title: 'Alice\'s Editor',
                      accentColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Editor 2 - Bob
                  Expanded(
                    child: CollaborativeEditor(
                      documentId: documentId,
                      userId: user2Id,
                      title: 'Bob\'s Editor',
                      accentColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Collaborative Notes Demo'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This demo shows real-time collaborative editing using:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('• Flutter with Riverpod state management'),
            Text('• Firebase Firestore for real-time sync'),
            Text('• Custom diff-merge algorithm'),
            Text('• StreamProvider.family for document streams'),
            Text('• StateNotifierProvider for editor state'),
            SizedBox(height: 12),
            Text(
              'Features:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Instant synchronization between editors'),
            Text('• Conflict resolution with cursor preservation'),
            Text('• Connection status indicators'),
            Text('• Debounced auto-save'),
            Text('• Version tracking'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}