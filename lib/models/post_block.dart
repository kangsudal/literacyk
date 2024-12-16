import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'converter/timestamp_converter.dart';

part 'post_block.g.dart';
part 'post_block.freezed.dart';

@freezed
class PostBlock with _$PostBlock {
  const factory PostBlock({
    required String blockId,        // 차단 ID
    required String postId,         // 차단된 게시글 ID
    required String blockedBy,      // 차단한 사용자 ID
    @TimestampConverter() required DateTime blockedAt, // 차단 일시
  }) = _PostBlock;

  factory PostBlock.fromJson(Map<String, dynamic> json) =>
      _$PostBlockFromJson(json);
}
