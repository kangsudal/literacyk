// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  List<String> get imgUrls => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<ClapRecord> get clapRecords =>
      throw _privateConstructorUsedError; //각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
  List<String> get bookmarkedBy =>
      throw _privateConstructorUsedError; //이 레시피를 북마크한 유저 UID 리스트
  List<String> get viewedBy => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String title,
      String contents,
      List<String> imgUrls,
      @TimestampConverter() DateTime createdAt,
      String createdBy,
      @TimestampConverter() DateTime updatedAt,
      List<ClapRecord> clapRecords,
      List<String> bookmarkedBy,
      List<String> viewedBy});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? contents = null,
    Object? imgUrls = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? clapRecords = null,
    Object? bookmarkedBy = null,
    Object? viewedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrls: null == imgUrls
          ? _value.imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clapRecords: null == clapRecords
          ? _value.clapRecords
          : clapRecords // ignore: cast_nullable_to_non_nullable
              as List<ClapRecord>,
      bookmarkedBy: null == bookmarkedBy
          ? _value.bookmarkedBy
          : bookmarkedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      viewedBy: null == viewedBy
          ? _value.viewedBy
          : viewedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String contents,
      List<String> imgUrls,
      @TimestampConverter() DateTime createdAt,
      String createdBy,
      @TimestampConverter() DateTime updatedAt,
      List<ClapRecord> clapRecords,
      List<String> bookmarkedBy,
      List<String> viewedBy});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? contents = null,
    Object? imgUrls = null,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = null,
    Object? clapRecords = null,
    Object? bookmarkedBy = null,
    Object? viewedBy = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrls: null == imgUrls
          ? _value._imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clapRecords: null == clapRecords
          ? _value._clapRecords
          : clapRecords // ignore: cast_nullable_to_non_nullable
              as List<ClapRecord>,
      bookmarkedBy: null == bookmarkedBy
          ? _value._bookmarkedBy
          : bookmarkedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      viewedBy: null == viewedBy
          ? _value._viewedBy
          : viewedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PostImpl with DiagnosticableTreeMixin implements _Post {
  const _$PostImpl(
      {this.id = '',
      this.title = '',
      this.contents = '',
      final List<String> imgUrls = const [],
      @TimestampConverter() required this.createdAt,
      this.createdBy = '',
      @TimestampConverter() required this.updatedAt,
      final List<ClapRecord> clapRecords = const [],
      final List<String> bookmarkedBy = const [],
      final List<String> viewedBy = const []})
      : _imgUrls = imgUrls,
        _clapRecords = clapRecords,
        _bookmarkedBy = bookmarkedBy,
        _viewedBy = viewedBy;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String contents;
  final List<String> _imgUrls;
  @override
  @JsonKey()
  List<String> get imgUrls {
    if (_imgUrls is EqualUnmodifiableListView) return _imgUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgUrls);
  }

  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @JsonKey()
  final String createdBy;
  @override
  @TimestampConverter()
  final DateTime updatedAt;
  final List<ClapRecord> _clapRecords;
  @override
  @JsonKey()
  List<ClapRecord> get clapRecords {
    if (_clapRecords is EqualUnmodifiableListView) return _clapRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clapRecords);
  }

//각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
  final List<String> _bookmarkedBy;
//각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
  @override
  @JsonKey()
  List<String> get bookmarkedBy {
    if (_bookmarkedBy is EqualUnmodifiableListView) return _bookmarkedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarkedBy);
  }

//이 레시피를 북마크한 유저 UID 리스트
  final List<String> _viewedBy;
//이 레시피를 북마크한 유저 UID 리스트
  @override
  @JsonKey()
  List<String> get viewedBy {
    if (_viewedBy is EqualUnmodifiableListView) return _viewedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewedBy);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Post(id: $id, title: $title, contents: $contents, imgUrls: $imgUrls, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, clapRecords: $clapRecords, bookmarkedBy: $bookmarkedBy, viewedBy: $viewedBy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Post'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('contents', contents))
      ..add(DiagnosticsProperty('imgUrls', imgUrls))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('clapRecords', clapRecords))
      ..add(DiagnosticsProperty('bookmarkedBy', bookmarkedBy))
      ..add(DiagnosticsProperty('viewedBy', viewedBy));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            const DeepCollectionEquality().equals(other._imgUrls, _imgUrls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._clapRecords, _clapRecords) &&
            const DeepCollectionEquality()
                .equals(other._bookmarkedBy, _bookmarkedBy) &&
            const DeepCollectionEquality().equals(other._viewedBy, _viewedBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      contents,
      const DeepCollectionEquality().hash(_imgUrls),
      createdAt,
      createdBy,
      updatedAt,
      const DeepCollectionEquality().hash(_clapRecords),
      const DeepCollectionEquality().hash(_bookmarkedBy),
      const DeepCollectionEquality().hash(_viewedBy));

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);
}

abstract class _Post implements Post {
  const factory _Post(
      {final String id,
      final String title,
      final String contents,
      final List<String> imgUrls,
      @TimestampConverter() required final DateTime createdAt,
      final String createdBy,
      @TimestampConverter() required final DateTime updatedAt,
      final List<ClapRecord> clapRecords,
      final List<String> bookmarkedBy,
      final List<String> viewedBy}) = _$PostImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get contents;
  @override
  List<String> get imgUrls;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String get createdBy;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  List<ClapRecord> get clapRecords; //각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
  @override
  List<String> get bookmarkedBy; //이 레시피를 북마크한 유저 UID 리스트
  @override
  List<String> get viewedBy;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
