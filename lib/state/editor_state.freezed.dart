// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditorState {
  String get content => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasUnsavedChanges => throw _privateConstructorUsedError;
  int get localVersion => throw _privateConstructorUsedError;
  int get remoteVersion => throw _privateConstructorUsedError;
  TextSelection? get selection => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of EditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditorStateCopyWith<EditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorStateCopyWith<$Res> {
  factory $EditorStateCopyWith(
          EditorState value, $Res Function(EditorState) then) =
      _$EditorStateCopyWithImpl<$Res, EditorState>;
  @useResult
  $Res call(
      {String content,
      String documentId,
      String userId,
      bool isLoading,
      bool hasUnsavedChanges,
      int localVersion,
      int remoteVersion,
      TextSelection? selection,
      String? error});
}

/// @nodoc
class _$EditorStateCopyWithImpl<$Res, $Val extends EditorState>
    implements $EditorStateCopyWith<$Res> {
  _$EditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? documentId = null,
    Object? userId = null,
    Object? isLoading = null,
    Object? hasUnsavedChanges = null,
    Object? localVersion = null,
    Object? remoteVersion = null,
    Object? selection = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasUnsavedChanges: null == hasUnsavedChanges
          ? _value.hasUnsavedChanges
          : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
              as bool,
      localVersion: null == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as int,
      remoteVersion: null == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as int,
      selection: freezed == selection
          ? _value.selection
          : selection // ignore: cast_nullable_to_non_nullable
              as TextSelection?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditorStateImplCopyWith<$Res>
    implements $EditorStateCopyWith<$Res> {
  factory _$$EditorStateImplCopyWith(
          _$EditorStateImpl value, $Res Function(_$EditorStateImpl) then) =
      __$$EditorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String content,
      String documentId,
      String userId,
      bool isLoading,
      bool hasUnsavedChanges,
      int localVersion,
      int remoteVersion,
      TextSelection? selection,
      String? error});
}

/// @nodoc
class __$$EditorStateImplCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorStateImpl>
    implements _$$EditorStateImplCopyWith<$Res> {
  __$$EditorStateImplCopyWithImpl(
      _$EditorStateImpl _value, $Res Function(_$EditorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? documentId = null,
    Object? userId = null,
    Object? isLoading = null,
    Object? hasUnsavedChanges = null,
    Object? localVersion = null,
    Object? remoteVersion = null,
    Object? selection = freezed,
    Object? error = freezed,
  }) {
    return _then(_$EditorStateImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasUnsavedChanges: null == hasUnsavedChanges
          ? _value.hasUnsavedChanges
          : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
              as bool,
      localVersion: null == localVersion
          ? _value.localVersion
          : localVersion // ignore: cast_nullable_to_non_nullable
              as int,
      remoteVersion: null == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as int,
      selection: freezed == selection
          ? _value.selection
          : selection // ignore: cast_nullable_to_non_nullable
              as TextSelection?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditorStateImpl implements _EditorState {
  const _$EditorStateImpl(
      {required this.content,
      required this.documentId,
      required this.userId,
      this.isLoading = false,
      this.hasUnsavedChanges = false,
      this.localVersion = 0,
      this.remoteVersion = 0,
      this.selection,
      this.error});

  @override
  final String content;
  @override
  final String documentId;
  @override
  final String userId;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasUnsavedChanges;
  @override
  @JsonKey()
  final int localVersion;
  @override
  @JsonKey()
  final int remoteVersion;
  @override
  final TextSelection? selection;
  @override
  final String? error;

  @override
  String toString() {
    return 'EditorState(content: $content, documentId: $documentId, userId: $userId, isLoading: $isLoading, hasUnsavedChanges: $hasUnsavedChanges, localVersion: $localVersion, remoteVersion: $remoteVersion, selection: $selection, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasUnsavedChanges, hasUnsavedChanges) ||
                other.hasUnsavedChanges == hasUnsavedChanges) &&
            (identical(other.localVersion, localVersion) ||
                other.localVersion == localVersion) &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion) &&
            (identical(other.selection, selection) ||
                other.selection == selection) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      documentId,
      userId,
      isLoading,
      hasUnsavedChanges,
      localVersion,
      remoteVersion,
      selection,
      error);

  /// Create a copy of EditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateImplCopyWith<_$EditorStateImpl> get copyWith =>
      __$$EditorStateImplCopyWithImpl<_$EditorStateImpl>(this, _$identity);
}

abstract class _EditorState implements EditorState {
  const factory _EditorState(
      {required final String content,
      required final String documentId,
      required final String userId,
      final bool isLoading,
      final bool hasUnsavedChanges,
      final int localVersion,
      final int remoteVersion,
      final TextSelection? selection,
      final String? error}) = _$EditorStateImpl;

  @override
  String get content;
  @override
  String get documentId;
  @override
  String get userId;
  @override
  bool get isLoading;
  @override
  bool get hasUnsavedChanges;
  @override
  int get localVersion;
  @override
  int get remoteVersion;
  @override
  TextSelection? get selection;
  @override
  String? get error;

  /// Create a copy of EditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditorStateImplCopyWith<_$EditorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TextDiff {
  int get start => throw _privateConstructorUsedError;
  int get deleteLength => throw _privateConstructorUsedError;
  String get insert => throw _privateConstructorUsedError;

  /// Create a copy of TextDiff
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextDiffCopyWith<TextDiff> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextDiffCopyWith<$Res> {
  factory $TextDiffCopyWith(TextDiff value, $Res Function(TextDiff) then) =
      _$TextDiffCopyWithImpl<$Res, TextDiff>;
  @useResult
  $Res call({int start, int deleteLength, String insert});
}

/// @nodoc
class _$TextDiffCopyWithImpl<$Res, $Val extends TextDiff>
    implements $TextDiffCopyWith<$Res> {
  _$TextDiffCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextDiff
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? deleteLength = null,
    Object? insert = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      deleteLength: null == deleteLength
          ? _value.deleteLength
          : deleteLength // ignore: cast_nullable_to_non_nullable
              as int,
      insert: null == insert
          ? _value.insert
          : insert // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextDiffImplCopyWith<$Res>
    implements $TextDiffCopyWith<$Res> {
  factory _$$TextDiffImplCopyWith(
          _$TextDiffImpl value, $Res Function(_$TextDiffImpl) then) =
      __$$TextDiffImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start, int deleteLength, String insert});
}

/// @nodoc
class __$$TextDiffImplCopyWithImpl<$Res>
    extends _$TextDiffCopyWithImpl<$Res, _$TextDiffImpl>
    implements _$$TextDiffImplCopyWith<$Res> {
  __$$TextDiffImplCopyWithImpl(
      _$TextDiffImpl _value, $Res Function(_$TextDiffImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextDiff
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? deleteLength = null,
    Object? insert = null,
  }) {
    return _then(_$TextDiffImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      deleteLength: null == deleteLength
          ? _value.deleteLength
          : deleteLength // ignore: cast_nullable_to_non_nullable
              as int,
      insert: null == insert
          ? _value.insert
          : insert // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TextDiffImpl implements _TextDiff {
  const _$TextDiffImpl(
      {required this.start, required this.deleteLength, required this.insert});

  @override
  final int start;
  @override
  final int deleteLength;
  @override
  final String insert;

  @override
  String toString() {
    return 'TextDiff(start: $start, deleteLength: $deleteLength, insert: $insert)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextDiffImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.deleteLength, deleteLength) ||
                other.deleteLength == deleteLength) &&
            (identical(other.insert, insert) || other.insert == insert));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, deleteLength, insert);

  /// Create a copy of TextDiff
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextDiffImplCopyWith<_$TextDiffImpl> get copyWith =>
      __$$TextDiffImplCopyWithImpl<_$TextDiffImpl>(this, _$identity);
}

abstract class _TextDiff implements TextDiff {
  const factory _TextDiff(
      {required final int start,
      required final int deleteLength,
      required final String insert}) = _$TextDiffImpl;

  @override
  int get start;
  @override
  int get deleteLength;
  @override
  String get insert;

  /// Create a copy of TextDiff
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextDiffImplCopyWith<_$TextDiffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
