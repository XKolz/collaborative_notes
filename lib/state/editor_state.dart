// lib/state/editor_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'editor_state.freezed.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState({
    required String content,
    required String documentId,
    required String userId,
    @Default(false) bool isLoading,
    @Default(false) bool hasUnsavedChanges,
    @Default(0) int localVersion,
    @Default(0) int remoteVersion,
    TextSelection? selection,
    String? error,
  }) = _EditorState;
}

@freezed
class TextDiff with _$TextDiff {
  const factory TextDiff({
    required int start,
    required int deleteLength,
    required String insert,
  }) = _TextDiff;
}