import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:literacyk/models/app_user.dart';
import 'package:literacyk/repositories/app_user_repository.dart';
import 'package:literacyk/repositories/app_user_repository_provider.dart';
import 'package:literacyk/repositories/auth_repository.dart';
import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_viewmodel.g.dart';

@riverpod
class UserProfileViewmodel extends _$UserProfileViewmodel {
  late AuthRepository authRepository;
  late AppUserRepository appUserRepository;
  @override
  FutureOr<AppUser> build(String uid) {
    //fmaily provider이 됨
    authRepository = ref.watch(authRepositoryProvider);
    appUserRepository = ref.watch(appUserRepositoryProvider);
    return appUserRepository.getProfile(uid: uid);
  }

  Future<void> signout() async {
    state = const AsyncLoading();
    await AsyncValue.guard(
      () => authRepository.signout(),
    );
    ref.invalidate(appUserRepositoryProvider);
    ref.invalidate(authRepositoryProvider);
  }
}

// 작성자의 UID -> 이름 변환 Provider
final userNameProvider = FutureProvider.family<String, String>((ref, uid) async {
  final appUserRepository = ref.read(appUserRepositoryProvider);
  final appUser = await appUserRepository.getProfile(uid: uid);
  return appUser.name;
});