// lib/providers/providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/document.dart';
import '../services/firebase_service.dart';
import '../state/editor_state.dart';
import 'editor_notifier.dart';

/// StreamProvider.family for document streams
final documentStreamProvider =
    StreamProvider.family<Document, String>((ref, documentId) {
  // Keep the stream alive even if widget is temporarily removed
  ref.keepAlive();

  return FirebaseService.documentStream(documentId);
});

/// StateNotifierProvider for editor state management
final editorStateProvider = StateNotifierProvider.family<EditorStateNotifier,
    EditorState, EditorParams>((ref, params) {
  final notifier = EditorStateNotifier(
    documentId: params.documentId,
    userId: params.userId,
  );

  // Listen to document stream and handle remote changes
  ref.listen(documentStreamProvider(params.documentId), (previous, next) {
    next.whenData((document) {
      notifier.handleRemoteChange(document);
    });
  });

  return notifier;
});

/// Parameters for editor state provider
class EditorParams {
  final String documentId;
  final String userId;

  EditorParams({
    required this.documentId,
    required this.userId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditorParams &&
          runtimeType == other.runtimeType &&
          documentId == other.documentId &&
          userId == other.userId;

  @override
  int get hashCode => documentId.hashCode ^ userId.hashCode;
}

/// Provider for generating unique user IDs
final userIdProvider = Provider.family<String, String>((ref, suffix) {
  return 'user_$suffix';
});
