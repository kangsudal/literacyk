import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_viewmodel.g.dart';

@riverpod
class SignupViewmodel extends _$SignupViewmodel {

  @override
  FutureOr<void> build() {
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    await ref
          .read(authRepositoryProvider)
          .signup(name: name, email: email, password: password
    );
  }
}
