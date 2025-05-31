// lib/services/diff_merge_service.dart
import '../state/editor_state.dart';
import '../models/document.dart';
import 'package:flutter/material.dart';

class DiffMergeService {
  /// Merges remote changes with local content, preserving cursor position when possible
  static MergeResult mergeChanges({
    required String localContent,
    required String remoteContent,
    required String baseContent,
    TextSelection? localSelection,
  }) {
    // Simple three-way merge strategy
    if (localContent == remoteContent) {
      return MergeResult(
        content: localContent,
        selection: localSelection,
        hasConflict: false,
      );
    }

    // If local content hasn't changed from base, accept remote
    if (localContent == baseContent) {
      return MergeResult(
        content: remoteContent,
        selection:
            _adjustSelection(localSelection, localContent, remoteContent),
        hasConflict: false,
      );
    }

    // If remote content hasn't changed from base, keep local
    if (remoteContent == baseContent) {
      return MergeResult(
        content: localContent,
        selection: localSelection,
        hasConflict: false,
      );
    }

    // Both have changes - attempt automatic merge
    final mergeResult = _attemptAutoMerge(
      localContent: localContent,
      remoteContent: remoteContent,
      baseContent: baseContent,
      localSelection: localSelection,
    );

    return mergeResult;
  }

  static MergeResult _attemptAutoMerge({
    required String localContent,
    required String remoteContent,
    required String baseContent,
    TextSelection? localSelection,
  }) {
    // Generate diffs
    final localDiffs = _generateDiffs(baseContent, localContent);
    final remoteDiffs = _generateDiffs(baseContent, remoteContent);

    // Check for overlapping changes
    if (_hasOverlappingChanges(localDiffs, remoteDiffs)) {
      // Conflict detected - prefer remote changes (simple strategy)
      return MergeResult(
        content: remoteContent,
        selection:
            _adjustSelection(localSelection, localContent, remoteContent),
        hasConflict: true,
      );
    }

    // Apply both sets of changes
    String result = baseContent;
    TextSelection? adjustedSelection = localSelection;

    // Sort diffs by position (reverse order to avoid offset issues)
    final allDiffs = [...localDiffs, ...remoteDiffs]
      ..sort((a, b) => b.start.compareTo(a.start));

    for (final diff in allDiffs) {
      result = _applyDiff(result, diff);
      adjustedSelection = _adjustSelectionForDiff(adjustedSelection, diff);
    }

    return MergeResult(
      content: result,
      selection: adjustedSelection,
      hasConflict: false,
    );
  }

  static List<TextDiff> _generateDiffs(String from, String to) {
    // Simple diff implementation - in production, use a proper diff library
    if (from == to) return [];

    // For simplicity, treat as single replacement
    return [
      TextDiff(
        start: 0,
        deleteLength: from.length,
        insert: to,
      ),
    ];
  }

  static bool _hasOverlappingChanges(
      List<TextDiff> localDiffs, List<TextDiff> remoteDiffs) {
    for (final localDiff in localDiffs) {
      for (final remoteDiff in remoteDiffs) {
        final localEnd = localDiff.start + localDiff.deleteLength;
        final remoteEnd = remoteDiff.start + remoteDiff.deleteLength;

        // Check for overlap
        if (!(localEnd <= remoteDiff.start || remoteEnd <= localDiff.start)) {
          return true;
        }
      }
    }
    return false;
  }

  static String _applyDiff(String content, TextDiff diff) {
    final before = content.substring(0, diff.start);
    final after = content.substring(diff.start + diff.deleteLength);
    return before + diff.insert + after;
  }

  static TextSelection? _adjustSelectionForDiff(
      TextSelection? selection, TextDiff diff) {
    if (selection == null) return null;

    final diffEnd = diff.start + diff.deleteLength;
    final insertLength = diff.insert.length;
    final lengthChange = insertLength - diff.deleteLength;

    // If selection is entirely before the diff, no adjustment needed
    if (selection.end <= diff.start) {
      return selection;
    }

    // If selection is entirely after the diff, shift by length change
    if (selection.start >= diffEnd) {
      return TextSelection(
        baseOffset: selection.baseOffset + lengthChange,
        extentOffset: selection.extentOffset + lengthChange,
      );
    }

    // Selection overlaps with diff - place cursor at end of inserted text
    final newOffset = diff.start + insertLength;
    return TextSelection.collapsed(offset: newOffset);
  }

  static TextSelection? _adjustSelection(
    TextSelection? selection,
    String oldContent,
    String newContent,
  ) {
    if (selection == null) return null;

    // Simple adjustment - if new content is shorter, ensure selection is valid
    final maxOffset = newContent.length;
    final baseOffset = selection.baseOffset.clamp(0, maxOffset);
    final extentOffset = selection.extentOffset.clamp(0, maxOffset);

    return TextSelection(
      baseOffset: baseOffset,
      extentOffset: extentOffset,
    );
  }
}

class MergeResult {
  final String content;
  final TextSelection? selection;
  final bool hasConflict;

  MergeResult({
    required this.content,
    required this.selection,
    required this.hasConflict,
  });
}
