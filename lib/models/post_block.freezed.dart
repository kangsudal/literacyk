// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostBlock _$PostBlockFromJson(Map<String, dynamic> json) {
  return _PostBlock.fromJson(json);
}

/// @nodoc
mixin _$PostBlock {
  String get blockId => throw _privateConstructorUsedError; // 차단 ID
  String get postId => throw _privateConstructorUsedError; // 차단된 게시글 ID
  String get blockedBy => throw _privateConstructorUsedError; // 차단한 사용자 ID
  @TimestampConverter()
  DateTime get blockedAt => throw _privateConstructorUsedError;

  /// Serializes this PostBlock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostBlockCopyWith<PostBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostBlockCopyWith<$Res> {
  factory $PostBlockCopyWith(PostBlock value, $Res Function(PostBlock) then) =
      _$PostBlockCopyWithImpl<$Res, PostBlock>;
  @useResult
  $Res call(
      {String blockId,
      String postId,
      String blockedBy,
      @TimestampConverter() DateTime blockedAt});
}

/// @nodoc
class _$PostBlockCopyWithImpl<$Res, $Val extends PostBlock>
    implements $PostBlockCopyWith<$Res> {
  _$PostBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockId = null,
    Object? postId = null,
    Object? blockedBy = null,
    Object? blockedAt = null,
  }) {
    return _then(_value.copyWith(
      blockId: null == blockId
          ? _value.blockId
          : blockId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      blockedBy: null == blockedBy
          ? _value.blockedBy
          : blockedBy // ignore: cast_nullable_to_non_nullable
              as String,
      blockedAt: null == blockedAt
          ? _value.blockedAt
          : blockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostBlockImplCopyWith<$Res>
    implements $PostBlockCopyWith<$Res> {
  factory _$$PostBlockImplCopyWith(
          _$PostBlockImpl value, $Res Function(_$PostBlockImpl) then) =
      __$$PostBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String blockId,
      String postId,
      String blockedBy,
      @TimestampConverter() DateTime blockedAt});
}

/// @nodoc
class __$$PostBlockImplCopyWithImpl<$Res>
    extends _$PostBlockCopyWithImpl<$Res, _$PostBlockImpl>
    implements _$$PostBlockImplCopyWith<$Res> {
  __$$PostBlockImplCopyWithImpl(
      _$PostBlockImpl _value, $Res Function(_$PostBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockId = null,
    Object? postId = null,
    Object? blockedBy = null,
    Object? blockedAt = null,
  }) {
    return _then(_$PostBlockImpl(
      blockId: null == blockId
          ? _value.blockId
          : blockId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      blockedBy: null == blockedBy
          ? _value.blockedBy
          : blockedBy // ignore: cast_nullable_to_non_nullable
              as String,
      blockedAt: null == blockedAt
          ? _value.blockedAt
          : blockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostBlockImpl implements _PostBlock {
  const _$PostBlockImpl(
      {required this.blockId,
      required this.postId,
      required this.blockedBy,
      @TimestampConverter() required this.blockedAt});

  factory _$PostBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostBlockImplFromJson(json);

  @override
  final String blockId;
// 차단 ID
  @override
  final String postId;
// 차단된 게시글 ID
  @override
  final String blockedBy;
// 차단한 사용자 ID
  @override
  @TimestampConverter()
  final DateTime blockedAt;

  @override
  String toString() {
    return 'PostBlock(blockId: $blockId, postId: $postId, blockedBy: $blockedBy, blockedAt: $blockedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostBlockImpl &&
            (identical(other.blockId, blockId) || other.blockId == blockId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.blockedBy, blockedBy) ||
                other.blockedBy == blockedBy) &&
            (identical(other.blockedAt, blockedAt) ||
                other.blockedAt == blockedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, blockId, postId, blockedBy, blockedAt);

  /// Create a copy of PostBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostBlockImplCopyWith<_$PostBlockImpl> get copyWith =>
      __$$PostBlockImplCopyWithImpl<_$PostBlockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostBlockImplToJson(
      this,
    );
  }
}

abstract class _PostBlock implements PostBlock {
  const factory _PostBlock(
          {required final String blockId,
          required final String postId,
          required final String blockedBy,
          @TimestampConverter() required final DateTime blockedAt}) =
      _$PostBlockImpl;

  factory _PostBlock.fromJson(Map<String, dynamic> json) =
      _$PostBlockImpl.fromJson;

  @override
  String get blockId; // 차단 ID
  @override
  String get postId; // 차단된 게시글 ID
  @override
  String get blockedBy; // 차단한 사용자 ID
  @override
  @TimestampConverter()
  DateTime get blockedAt;

  /// Create a copy of PostBlock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostBlockImplCopyWith<_$PostBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
