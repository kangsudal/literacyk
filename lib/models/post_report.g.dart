// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostReportImpl _$$PostReportImplFromJson(Map<String, dynamic> json) =>
    _$PostReportImpl(
      reportId: json['reportId'] as String,
      postId: json['postId'] as String,
      reportedBy: json['reportedBy'] as String,
      reportReason: json['reportReason'] as String,
      reportedAt:
          const TimestampConverter().fromJson(json['reportedAt'] as Timestamp),
      status: $enumDecode(_$ReportStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$PostReportImplToJson(_$PostReportImpl instance) =>
    <String, dynamic>{
      'reportId': instance.reportId,
      'postId': instance.postId,
      'reportedBy': instance.reportedBy,
      'reportReason': instance.reportReason,
      'reportedAt': const TimestampConverter().toJson(instance.reportedAt),
      'status': _$ReportStatusEnumMap[instance.status]!,
    };

const _$ReportStatusEnumMap = {
  ReportStatus.inProgress: 'inProgress',
  ReportStatus.complete: 'complete',
  ReportStatus.invalidation: 'invalidation',
};
