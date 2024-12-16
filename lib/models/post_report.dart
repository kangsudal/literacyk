import 'package:freezed_annotation/freezed_annotation.dart';
import 'converter/timestamp_converter.dart';

part 'post_report.g.dart';
part 'post_report.freezed.dart';

@freezed
class PostReport with _$PostReport {
  const factory PostReport({
    required String reportId,        // 신고 ID
    required String postId,          // 신고된 게시글 ID
    required String reportedBy,      // 신고한 사용자 ID
    required String reportReason,    // 신고 사유
    @TimestampConverter() required DateTime reportedAt, // 신고 일시
    required ReportStatus status,    // 신고 상태
  }) = _PostReport;

  factory PostReport.fromJson(Map<String, dynamic> json) =>
      _$PostReportFromJson(json);
}

enum ReportStatus {
  @JsonValue("inProgress")
  inProgress, //처리중
  @JsonValue("complete")
  complete, //완료
  @JsonValue("invalidation")
  invalidation, //무효화
}
