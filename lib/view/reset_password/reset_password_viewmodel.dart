import 'package:literacyk/repositories/auth_repository.dart';
import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_viewmodel.g.dart';

@riverpod
class ResetPasswordViewmodel extends _$ResetPasswordViewmodel {
  AuthRepository authRepository = AuthRepository();
  @override
  FutureOr<void> build() {
    authRepository = ref.watch(authRepositoryProvider);
  }

  Future<void> resetPassword({required String email}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(authRepositoryProvider).sendPasswordResetEmail(email));
  }
}
