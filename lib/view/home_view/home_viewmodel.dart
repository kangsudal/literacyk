import 'package:literacyk/repositories/auth_repository.dart';
import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewmodel extends _$HomeViewmodel {
  late AuthRepository authRepository;
  @override
  FutureOr<void> build() {
    authRepository = ref.read(authRepositoryProvider);
  }

  Future<void> signout() async {
    state = const AsyncLoading<void>();
    await AsyncValue.guard(
      () => authRepository.signout(),
    );
    state = const AsyncData(null);
  }
}
