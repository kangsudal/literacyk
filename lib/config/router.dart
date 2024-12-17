import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/repositories/auth_repository_provider.dart';
import 'package:literacyk/view/firebase_error_view/firebase_error_view.dart';
import 'package:literacyk/view/home_view/home_view.dart';
import 'package:literacyk/view/reset_password/reset_password_view.dart';
import 'package:literacyk/view/signin_view/signin_view.dart';
import 'package:literacyk/view/signup_view/signup_view.dart';
import 'package:literacyk/view/splash_view/splash_view.dart';
import 'package:literacyk/view/verify_email_view/verify_email_view.dart';
import 'package:literacyk/view/write_view/write_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

/// 인증상태(authStateStreamProvider의 state)가 변할때마다 routerProvider가 rebuild됨
/// redirect 콜백이 실행됨

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateStreamProvider);

  return GoRouter(
    initialLocation: '/signin', //'/splash',
    redirect: (context, state) {
      if (authState is AsyncLoading<User?>) {
        return '/splash';
      }
      if (authState is AsyncError<User?>) {
        return '/firebaseError';
      }
      // true: 로그인된 상태, false: 로그인 안된 상태
      final authenticated = authState.valueOrNull != null;

      // 로그인 중인 상태
      final authenticating = (state.matchedLocation == '/signin') ||
          (state.matchedLocation == '/signup') ||
          (state.matchedLocation == '/resetPassword');

      // 로그인 상태가 아닌 상태에서 로그인 진행중화면으로 가는건 Ok, 다른 화면으론 못가게 signin으로 redirect
      if (authenticated == false) {
        return authenticating ? null : '/signin';
      }

      // 여기서부턴 uthenticated == true로 로그인된 상태.
      // 이메일 검증을 한 사용자만 서비스를 사용할 수 있도록 함
      if (!fbAuth.currentUser!.emailVerified) {
        return '/verifyEmail';
      }

      final verifyingEmail = state.matchedLocation == '/verifyEmail';
      final splashing = state.matchedLocation == '/splash';

      //인증이 되고, 이메일도 verify된 상태에서 불필요한 페이지로 접근하려면 home으로 redirect
      return (authenticating || verifyingEmail || splashing) ? '/home' : null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: RouteNames.splash,
        builder: (context, state) {
          debugPrint('#### Splash ####');
          return SplashView();
        },
      ),
      GoRoute(
        path: '/firebaseError',
        name: RouteNames.firebaseError,
        builder: (context, state) {
          return FirebaseErrorView();
        },
      ),
      GoRoute(
        path: '/signin',
        name: RouteNames.signin,
        builder: (context, state) {
          return SigninView();
        },
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) {
          return SignupView();
        },
      ),
      GoRoute(
        path: '/resetPassword',
        name: RouteNames.resetPassword,
        builder: (context, state) {
          return ResetPasswordView();
        },
      ),
      GoRoute(
        path: '/verifyEmail',
        name: RouteNames.verifyEmail,
        builder: (context, state) {
          return VerifyEmailView();
        },
      ),
      GoRoute(
          path: '/write',
          name: RouteNames.write,
          builder: (context, state) {
            return WriteView();
          }),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) {
          return HomeView();
        },
        routes: [
          // GoRoute(
          //   path: 'changePassword',
          //   name:RouteNames.changePassword,
          //   builder: (context,state){
          //     return ChangePasswordView();
          //   }
          // ),
        ],
      ),
      //
    ],
    // errorBuilder: (context, state){
    //   return PageNotFoundView(
    //     errorMessage: state.error.toString(),
    //   );
    // }
  );
}
