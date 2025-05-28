// test/diff_merge_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:collaborative_notes/services/diff_merge_service.dart';

void main() {
  group('DiffMergeService', () {
    test('should return local content when remote content is the same', () {
      const localContent = 'Hello world';
      const remoteContent = 'Hello world';
      const baseContent = 'Hello world';

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
      );

      expect(result.content, equals(localContent));
      expect(result.hasConflict, isFalse);
    });

    test('should accept remote changes when local content unchanged', () {
      const localContent = 'Hello world';
      const remoteContent = 'Hello beautiful world';
      const baseContent = 'Hello world';

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
      );

      expect(result.content, equals(remoteContent));
      expect(result.hasConflict, isFalse);
    });

    test('should keep local changes when remote content unchanged', () {
      const localContent = 'Hello amazing world';
      const remoteContent = 'Hello world';
      const baseContent = 'Hello world';

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
      );

      expect(result.content, equals(localContent));
      expect(result.hasConflict, isFalse);
    });

    test('should handle conflicts by preferring remote changes', () {
      const localContent = 'Hello amazing world';
      const remoteContent = 'Hello beautiful world';
      const baseContent = 'Hello world';

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
      );

      expect(result.content, equals(remoteContent));
      expect(result.hasConflict, isTrue);
    });

    test('should preserve text selection when possible', () {
      const localContent = 'Hello world';
      const remoteContent = 'Hello beautiful world';
      const baseContent = 'Hello world';
      const selection = TextSelection(baseOffset: 6, extentOffset: 11);

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
        localSelection: selection,
      );

      expect(result.selection, isNotNull);
      expect(result.selection!.baseOffset, lessThanOrEqualTo(result.content.length));
      expect(result.selection!.extentOffset, lessThanOrEqualTo(result.content.length));
    });

    test('should handle empty content', () {
      const localContent = '';
      const remoteContent = 'Hello world';
      const baseContent = '';

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
      );

      expect(result.content, equals(remoteContent));
      expect(result.hasConflict, isFalse);
    });

    test('should handle selection adjustment when content changes', () {
      const localContent = 'Hello world';
      const remoteContent = 'Hi world';
      const baseContent = 'Hello world';
      const selection = TextSelection.collapsed(offset: 11); // End of text

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
        localSelection: selection,
      );

      expect(result.selection, isNotNull);
      expect(result.selection!.offset, lessThanOrEqualTo(result.content.length));
    });

    test('should handle null selection gracefully', () {
      const localContent = 'Hello world';
      const remoteContent = 'Hello beautiful world';
      const baseContent = 'Hello world';

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
        localSelection: null,
      );

      expect(result.content, equals(remoteContent));
      expect(result.selection, isNull);
    });

    test('should handle multi-line content', () {
      const localContent = 'Line 1\nLine 2\nLine 3';
      const remoteContent = 'Line 1\nModified Line 2\nLine 3';
      const baseContent = 'Line 1\nLine 2\nLine 3';

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
      );

      expect(result.content, equals(remoteContent));
      expect(result.hasConflict, isFalse);
    });

    test('should handle large text differences', () {
      const baseContent = 'A short text';
      const localContent = 'A short text with local modifications that are quite long';
      const remoteContent = 'A short text with remote modifications that are also quite extensive';

      final result = DiffMergeService.mergeChanges(
        localContent: localContent,
        remoteContent: remoteContent,
        baseContent: baseContent,
      );

      expect(result.content, isNotEmpty);
      expect(result.hasConflict, isTrue);
      expect(result.content, equals(remoteContent)); // Should prefer remote in conflicts
    });
  });
}