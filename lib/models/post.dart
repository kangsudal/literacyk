import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:literacyk/models/clap_record.dart';

import 'converter/timestamp_converter.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const Post._();
  const factory Post({
    @Default('') String id,
    @Default('') String title,
    @Default('') String contents,
    @Default([]) List<String> imgUrls,
    @TimestampConverter() required DateTime createdAt,
    @Default('') String createdBy,
    @TimestampConverter() required DateTime updatedAt,
    @Default([]) List<ClapRecord> clapRecords, //각 사용자별 누른 박수 수 <채택된 유저 id,박수수>
    @Default([]) List<String> bookmarkedBy, //이 레시피를 북마크한 유저 UID 리스트
    @Default([]) List<String> viewedBy, //이 레시피 조회한 유저 UID 리스트
  }) = _Post;

  factory Post.fromDoc(DocumentSnapshot postDoc) {
    final postData = postDoc.data() as Map<String, dynamic>;

    return Post(
      id: postDoc.id,
      title: postData['title'] ?? '',
      contents: postData['contents'] ?? '',
      imgUrls: List<String>.from(postData['imgUrls'] ?? []),
      createdAt: (postData['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (postData['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      createdBy: postData['createdBy'] ?? '',
      clapRecords: (postData['clapRecords'] as List<dynamic>)
          .map((e) => ClapRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookmarkedBy: List<String>.from(postData['bookmarkedBy'] ?? []),
      viewedBy: List<String>.from(postData['viewedBy'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'contents': contents,
      'imgUrls': imgUrls,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'createdBy': createdBy,
      'clapRecords': clapRecords.map((e) => e.toJson()).toList(),
      'bookmarkedBy': bookmarkedBy,
      'viewedBy': viewedBy,
    };
  }
}
