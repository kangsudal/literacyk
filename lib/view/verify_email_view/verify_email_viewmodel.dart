import 'package:literacyk/repositories/auth_repository.dart';
import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_email_viewmodel.g.dart';

@riverpod
class VerifyEmailViewmodel extends _$VerifyEmailViewmodel {
  late AuthRepository authRepository;
  Object? _key;

  @override
  FutureOr<void> build() {
    authRepository = ref.read(authRepositoryProvider);
    _key = Object();
    ref.onDispose(() {
      _key = null;
    });
  }

  Future<void> signout() async {
    state = const AsyncLoading<void>();
    final key = _key;
    final result = await AsyncValue.guard(
      () => authRepository.signout(),
    );
    if (key == _key) {
      state = result;
    }
  }

  Future<void> sendEmailVerification() async {
    state = const AsyncLoading<void>();
    final key = _key;
    final result = await AsyncValue.guard(
      () => authRepository.sendEmailVerification(),
    );
    if (key == _key) {
      state = result;
    }
  }

  Future<void> reloadUser() async {
    state = const AsyncLoading<void>();
    final key = _key;
    final result = await AsyncValue.guard(
      () => authRepository.reloadUser(),
    );
    if (key == _key) {
      state = result;
    }
  }
}
