// lib/widgets/collaborative_editor.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class CollaborativeEditor extends ConsumerStatefulWidget {
  final String documentId;
  final String userId;
  final String title;
  final Color? accentColor;

  const CollaborativeEditor({
    super.key,
    required this.documentId,
    required this.userId,
    required this.title,
    this.accentColor,
  });

  @override
  ConsumerState<CollaborativeEditor> createState() => _CollaborativeEditorState();
}

class _CollaborativeEditorState extends ConsumerState<CollaborativeEditor> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editorParams = EditorParams(
      documentId: widget.documentId,
      userId: widget.userId,
    );

    final editorState = ref.watch(editorStateProvider(editorParams));
    final documentStream = ref.watch(documentStreamProvider(widget.documentId));

    // Update controller when state changes
    ref.listen(editorStateProvider(editorParams), (previous, next) {
      if (next.content != _controller.text) {
        final selection = next.selection ?? _controller.selection;
        _controller.value = TextEditingValue(
          text: next.content,
          selection: selection,
        );
      }
    });

    return Card(
      elevation: 4,
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.accentColor?.withOpacity(0.1) ?? Colors.blue.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.edit_note,
                  color: widget.accentColor ?? Colors.blue,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: widget.accentColor ?? Colors.blue,
                  ),
                ),
                const Spacer(),
                // Status indicators
                if (editorState.isLoading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else if (editorState.hasUnsavedChanges)
                  Icon(
                    Icons.circle,
                    size: 12,
                    color: Colors.orange,
                  )
                else
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: Colors.green,
                  ),
                const SizedBox(width: 8),
                Text(
                  editorState.hasUnsavedChanges
                      ? 'Saving...'
                      : editorState.isLoading
                          ? 'Loading...'
                          : 'Saved',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          
          // Editor
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
                decoration: const InputDecoration(
                  hintText: 'Start typing to collaborate...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (value) {
                  ref.read(editorStateProvider(editorParams).notifier)
                      .updateContent(value, _controller.selection);
                },
              ),
            ),
          ),

          // Footer with connection status
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                documentStream.when(
                  data: (document) => Row(
                    children: [
                      Icon(
                        Icons.wifi,
                        size: 16,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Connected',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  loading: () => Row(
                    children: [
                      Icon(
                        Icons.wifi_off,
                        size: 16,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Connecting...',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  error: (error, stack) => Row(
                    children: [
                      Icon(
                        Icons.error,
                        size: 16,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Connection Error',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  'Version: ${editorState.remoteVersion}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}