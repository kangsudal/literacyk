import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_viewmodel.g.dart';

@riverpod
class SigninViewmodel extends _$SigninViewmodel {
  @override
  FutureOr<void> build() {}

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    await ref
        .read(authRepositoryProvider)
        .signin(email: email, password: password);
  }
}
