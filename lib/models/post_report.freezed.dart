// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostReport _$PostReportFromJson(Map<String, dynamic> json) {
  return _PostReport.fromJson(json);
}

/// @nodoc
mixin _$PostReport {
  String get reportId => throw _privateConstructorUsedError; // 신고 ID
  String get postId => throw _privateConstructorUsedError; // 신고된 게시글 ID
  String get reportedBy => throw _privateConstructorUsedError; // 신고한 사용자 ID
  String get reportReason => throw _privateConstructorUsedError; // 신고 사유
  @TimestampConverter()
  DateTime get reportedAt => throw _privateConstructorUsedError; // 신고 일시
  ReportStatus get status => throw _privateConstructorUsedError;

  /// Serializes this PostReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostReportCopyWith<PostReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostReportCopyWith<$Res> {
  factory $PostReportCopyWith(
          PostReport value, $Res Function(PostReport) then) =
      _$PostReportCopyWithImpl<$Res, PostReport>;
  @useResult
  $Res call(
      {String reportId,
      String postId,
      String reportedBy,
      String reportReason,
      @TimestampConverter() DateTime reportedAt,
      ReportStatus status});
}

/// @nodoc
class _$PostReportCopyWithImpl<$Res, $Val extends PostReport>
    implements $PostReportCopyWith<$Res> {
  _$PostReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? postId = null,
    Object? reportedBy = null,
    Object? reportReason = null,
    Object? reportedAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      reportedBy: null == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String,
      reportReason: null == reportReason
          ? _value.reportReason
          : reportReason // ignore: cast_nullable_to_non_nullable
              as String,
      reportedAt: null == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostReportImplCopyWith<$Res>
    implements $PostReportCopyWith<$Res> {
  factory _$$PostReportImplCopyWith(
          _$PostReportImpl value, $Res Function(_$PostReportImpl) then) =
      __$$PostReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reportId,
      String postId,
      String reportedBy,
      String reportReason,
      @TimestampConverter() DateTime reportedAt,
      ReportStatus status});
}

/// @nodoc
class __$$PostReportImplCopyWithImpl<$Res>
    extends _$PostReportCopyWithImpl<$Res, _$PostReportImpl>
    implements _$$PostReportImplCopyWith<$Res> {
  __$$PostReportImplCopyWithImpl(
      _$PostReportImpl _value, $Res Function(_$PostReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? postId = null,
    Object? reportedBy = null,
    Object? reportReason = null,
    Object? reportedAt = null,
    Object? status = null,
  }) {
    return _then(_$PostReportImpl(
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      reportedBy: null == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String,
      reportReason: null == reportReason
          ? _value.reportReason
          : reportReason // ignore: cast_nullable_to_non_nullable
              as String,
      reportedAt: null == reportedAt
          ? _value.reportedAt
          : reportedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostReportImpl implements _PostReport {
  const _$PostReportImpl(
      {required this.reportId,
      required this.postId,
      required this.reportedBy,
      required this.reportReason,
      @TimestampConverter() required this.reportedAt,
      required this.status});

  factory _$PostReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostReportImplFromJson(json);

  @override
  final String reportId;
// 신고 ID
  @override
  final String postId;
// 신고된 게시글 ID
  @override
  final String reportedBy;
// 신고한 사용자 ID
  @override
  final String reportReason;
// 신고 사유
  @override
  @TimestampConverter()
  final DateTime reportedAt;
// 신고 일시
  @override
  final ReportStatus status;

  @override
  String toString() {
    return 'PostReport(reportId: $reportId, postId: $postId, reportedBy: $reportedBy, reportReason: $reportReason, reportedAt: $reportedAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostReportImpl &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.reportedBy, reportedBy) ||
                other.reportedBy == reportedBy) &&
            (identical(other.reportReason, reportReason) ||
                other.reportReason == reportReason) &&
            (identical(other.reportedAt, reportedAt) ||
                other.reportedAt == reportedAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportId, postId, reportedBy,
      reportReason, reportedAt, status);

  /// Create a copy of PostReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostReportImplCopyWith<_$PostReportImpl> get copyWith =>
      __$$PostReportImplCopyWithImpl<_$PostReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostReportImplToJson(
      this,
    );
  }
}

abstract class _PostReport implements PostReport {
  const factory _PostReport(
      {required final String reportId,
      required final String postId,
      required final String reportedBy,
      required final String reportReason,
      @TimestampConverter() required final DateTime reportedAt,
      required final ReportStatus status}) = _$PostReportImpl;

  factory _PostReport.fromJson(Map<String, dynamic> json) =
      _$PostReportImpl.fromJson;

  @override
  String get reportId; // 신고 ID
  @override
  String get postId; // 신고된 게시글 ID
  @override
  String get reportedBy; // 신고한 사용자 ID
  @override
  String get reportReason; // 신고 사유
  @override
  @TimestampConverter()
  DateTime get reportedAt; // 신고 일시
  @override
  ReportStatus get status;

  /// Create a copy of PostReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostReportImplCopyWith<_$PostReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
