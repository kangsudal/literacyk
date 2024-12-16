import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clap_record.freezed.dart';
part 'clap_record.g.dart';

@freezed
class ClapRecord with _$ClapRecord {
  const factory ClapRecord({
    @Default('') String userUid, // 박수를 누른 사용자 ID
    @Default(0) int clapCount, // 해당 사용자가 누른 총 박수 수
  }) = _ClapRecord;

  factory ClapRecord.fromJson(Map<String, Object?> json) =>
      _$ClapRecordFromJson(json);
}
