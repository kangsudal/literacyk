// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostBlockImpl _$$PostBlockImplFromJson(Map<String, dynamic> json) =>
    _$PostBlockImpl(
      blockId: json['blockId'] as String,
      postId: json['postId'] as String,
      blockedBy: json['blockedBy'] as String,
      blockedAt:
          const TimestampConverter().fromJson(json['blockedAt'] as Timestamp),
    );

Map<String, dynamic> _$$PostBlockImplToJson(_$PostBlockImpl instance) =>
    <String, dynamic>{
      'blockId': instance.blockId,
      'postId': instance.postId,
      'blockedBy': instance.blockedBy,
      'blockedAt': const TimestampConverter().toJson(instance.blockedAt),
    };
