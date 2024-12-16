import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();
  const factory AppUser({
    @Default('') String id,
    @Default('') String name,
    @Default('') String email,
  }) = _AppUser;

  factory AppUser.fromMap(Map<String, dynamic> map, {required String id}) {
    return AppUser(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
