// lib/models/document.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document.freezed.dart';
part 'document.g.dart';

@freezed
class Document with _$Document {
  const factory Document({
    required String id,
    required String content,
    required DateTime lastModified,
    @Default('') String lastModifiedBy,
    @Default(0) int version,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}

@freezed
class DocumentChange with _$DocumentChange {
  const factory DocumentChange({
    required String documentId,
    required String content,
    required DateTime timestamp,
    required String userId,
    required int version,
  }) = _DocumentChange;

  factory DocumentChange.fromJson(Map<String, dynamic> json) =>
      _$DocumentChangeFromJson(json);
}
