import 'package:firebase_auth/firebase_auth.dart';
import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_repository_provider.g.dart';

/// AuthRepository:
/// Repository는 Model과 ViewModel 사이에 위치
/// 외부 데이터 소스와 상호작용하는 데이터 계층
///
/// AuthRepositoryProvider:
/// Repository를 앱 전반에 공급하는 의존성 주입

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

@riverpod
Stream<User?> authStateStream(Ref ref) {
  //authenticate State 변화 감지, 인증이 되지 않았을땐 null
  return fbAuth.authStateChanges();
}
