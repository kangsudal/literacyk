import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewmodel extends _$HomeViewmodel {
  @override
  FutureOr<void> build() {}

  Future<void> signout() async {
    state = const AsyncLoading<void>();
    await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signout(),
    );
  }
}
