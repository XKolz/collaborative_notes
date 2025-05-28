// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
mixin _$Document {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get lastModified => throw _privateConstructorUsedError;
  String get lastModifiedBy => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;

  /// Serializes this Document to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime lastModified,
      String lastModifiedBy,
      int version});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? lastModified = null,
    Object? lastModifiedBy = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedBy: null == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentImplCopyWith<$Res>
    implements $DocumentCopyWith<$Res> {
  factory _$$DocumentImplCopyWith(
          _$DocumentImpl value, $Res Function(_$DocumentImpl) then) =
      __$$DocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      DateTime lastModified,
      String lastModifiedBy,
      int version});
}

/// @nodoc
class __$$DocumentImplCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$DocumentImpl>
    implements _$$DocumentImplCopyWith<$Res> {
  __$$DocumentImplCopyWithImpl(
      _$DocumentImpl _value, $Res Function(_$DocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? lastModified = null,
    Object? lastModifiedBy = null,
    Object? version = null,
  }) {
    return _then(_$DocumentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedBy: null == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentImpl implements _Document {
  const _$DocumentImpl(
      {required this.id,
      required this.content,
      required this.lastModified,
      this.lastModifiedBy = '',
      this.version = 0});

  factory _$DocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime lastModified;
  @override
  @JsonKey()
  final String lastModifiedBy;
  @override
  @JsonKey()
  final int version;

  @override
  String toString() {
    return 'Document(id: $id, content: $content, lastModified: $lastModified, lastModifiedBy: $lastModifiedBy, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                other.lastModifiedBy == lastModifiedBy) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, content, lastModified, lastModifiedBy, version);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      __$$DocumentImplCopyWithImpl<_$DocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentImplToJson(
      this,
    );
  }
}

abstract class _Document implements Document {
  const factory _Document(
      {required final String id,
      required final String content,
      required final DateTime lastModified,
      final String lastModifiedBy,
      final int version}) = _$DocumentImpl;

  factory _Document.fromJson(Map<String, dynamic> json) =
      _$DocumentImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get lastModified;
  @override
  String get lastModifiedBy;
  @override
  int get version;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentChange _$DocumentChangeFromJson(Map<String, dynamic> json) {
  return _DocumentChange.fromJson(json);
}

/// @nodoc
mixin _$DocumentChange {
  String get documentId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;

  /// Serializes this DocumentChange to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentChangeCopyWith<DocumentChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentChangeCopyWith<$Res> {
  factory $DocumentChangeCopyWith(
          DocumentChange value, $Res Function(DocumentChange) then) =
      _$DocumentChangeCopyWithImpl<$Res, DocumentChange>;
  @useResult
  $Res call(
      {String documentId,
      String content,
      DateTime timestamp,
      String userId,
      int version});
}

/// @nodoc
class _$DocumentChangeCopyWithImpl<$Res, $Val extends DocumentChange>
    implements $DocumentChangeCopyWith<$Res> {
  _$DocumentChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? content = null,
    Object? timestamp = null,
    Object? userId = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentChangeImplCopyWith<$Res>
    implements $DocumentChangeCopyWith<$Res> {
  factory _$$DocumentChangeImplCopyWith(_$DocumentChangeImpl value,
          $Res Function(_$DocumentChangeImpl) then) =
      __$$DocumentChangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String documentId,
      String content,
      DateTime timestamp,
      String userId,
      int version});
}

/// @nodoc
class __$$DocumentChangeImplCopyWithImpl<$Res>
    extends _$DocumentChangeCopyWithImpl<$Res, _$DocumentChangeImpl>
    implements _$$DocumentChangeImplCopyWith<$Res> {
  __$$DocumentChangeImplCopyWithImpl(
      _$DocumentChangeImpl _value, $Res Function(_$DocumentChangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = null,
    Object? content = null,
    Object? timestamp = null,
    Object? userId = null,
    Object? version = null,
  }) {
    return _then(_$DocumentChangeImpl(
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentChangeImpl implements _DocumentChange {
  const _$DocumentChangeImpl(
      {required this.documentId,
      required this.content,
      required this.timestamp,
      required this.userId,
      required this.version});

  factory _$DocumentChangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentChangeImplFromJson(json);

  @override
  final String documentId;
  @override
  final String content;
  @override
  final DateTime timestamp;
  @override
  final String userId;
  @override
  final int version;

  @override
  String toString() {
    return 'DocumentChange(documentId: $documentId, content: $content, timestamp: $timestamp, userId: $userId, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentChangeImpl &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, documentId, content, timestamp, userId, version);

  /// Create a copy of DocumentChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentChangeImplCopyWith<_$DocumentChangeImpl> get copyWith =>
      __$$DocumentChangeImplCopyWithImpl<_$DocumentChangeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentChangeImplToJson(
      this,
    );
  }
}

abstract class _DocumentChange implements DocumentChange {
  const factory _DocumentChange(
      {required final String documentId,
      required final String content,
      required final DateTime timestamp,
      required final String userId,
      required final int version}) = _$DocumentChangeImpl;

  factory _DocumentChange.fromJson(Map<String, dynamic> json) =
      _$DocumentChangeImpl.fromJson;

  @override
  String get documentId;
  @override
  String get content;
  @override
  DateTime get timestamp;
  @override
  String get userId;
  @override
  int get version;

  /// Create a copy of DocumentChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentChangeImplCopyWith<_$DocumentChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
