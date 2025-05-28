// lib/providers/editor_notifier.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/editor_state.dart';
import '../models/document.dart';
import '../services/firebase_service.dart';
import '../services/diff_merge_service.dart';

class EditorStateNotifier extends StateNotifier<EditorState> {
  EditorStateNotifier({
    required String documentId,
    required String userId,
  }) : super(EditorState(
          content: '',
          documentId: documentId,
          userId: userId,
        )) {
    _initialize();
  }

  Timer? _debounceTimer;
  String _baseContent = '';
  String _lastSavedContent = '';

  void _initialize() async {
    state = state.copyWith(isLoading: true);
    
    try {
      final document = await FirebaseService.getDocument(state.documentId);
      if (document != null) {
        _baseContent = document.content;
        _lastSavedContent = document.content;
        
        state = state.copyWith(
          content: document.content,
          remoteVersion: document.version,
          localVersion: document.version,
          isLoading: false,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  /// Handle local text changes from user input
  void updateContent(String newContent, TextSelection? selection) {
    state = state.copyWith(
      content: newContent,
      selection: selection,
      hasUnsavedChanges: newContent != _lastSavedContent,
    );

    // Debounce save operations
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _saveToFirebase();
    });
  }

  /// Handle incoming remote changes
  void handleRemoteChange(Document document) {
    if (document.version <= state.remoteVersion) {
      return; // Ignore older versions
    }

    final remoteContent = document.content;
    
    // If we have no local changes, just accept the remote content
    if (!state.hasUnsavedChanges) {
      _baseContent = remoteContent;
      _lastSavedContent = remoteContent;
      
      state = state.copyWith(
        content: remoteContent,
        remoteVersion: document.version,
        localVersion: document.version,
      );
      return;
    }

    // Merge remote changes with local changes
    final mergeResult = DiffMergeService.mergeChanges(
      localContent: state.content,
      remoteContent: remoteContent,
      baseContent: _baseContent,
      localSelection: state.selection,
    );

    _baseContent = remoteContent;
    
    state = state.copyWith(
      content: mergeResult.content,
      selection: mergeResult.selection,
      remoteVersion: document.version,
      hasUnsavedChanges: mergeResult.content != remoteContent,
    );

    // If there was a conflict, user might want to know
    if (mergeResult.hasConflict) {
      // Could show a toast or update UI to indicate conflict resolution
      debugPrint('Merge conflict resolved automatically');
    }
  }

  /// Save current content to Firebase
  Future<void> _saveToFirebase() async {
    if (!state.hasUnsavedChanges) return;

    try {
      await FirebaseService.updateDocument(
        documentId: state.documentId,
        content: state.content,
        userId: state.userId,
      );

      _lastSavedContent = state.content;
      state = state.copyWith(
        hasUnsavedChanges: false,
        localVersion: state.localVersion + 1,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Force save (for testing or manual save)
  Future<void> forceSave() async {
    await _saveToFirebase();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}