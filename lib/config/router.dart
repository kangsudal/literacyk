import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/view/firebase_error_view/firebase_error_view.dart';
import 'package:literacyk/view/home_view/home_view.dart';
import 'package:literacyk/view/signin_view/signin_view.dart';
import 'package:literacyk/view/splash_view/splash_view.dart';

final GoRouter myRouter = GoRouter(
  initialLocation: '/signin',//'/splash',
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
  //   GoRoute(
  //     path: '/signup',
  //     name: RouteNames.signup,
  //     builder: (context, state) {
  //       return SignupView();
  //     },
  //   ),
  //   GoRoute(
  //     path: '/resetPassword',
  //     name: RouteNames.resetPassword,
  //     builder: (context, state) {
  //       return ResetPsswordView();
  //     },
  //   ),
  //   GoRoute(
  //     path: '/verifyEmail',
  //     name: RouteNames.verifyEmail,
  //     builder: (context, state) {
  //       return VerifyEmailView();
  //     },
  //   ),
  //   GoRoute(
  //     path: '/home',
  //     name: RouteNames.home,
  //     builder: (context, state) {
  //       return HomeView();
  //     },
  //     routes: [
  //       GoRoute(
  //         path: 'changePassword',
  //         name:RouteNames.changePassword,
  //         builder: (context,state){
  //           return ChangePasswordView();
  //         }
  //       ),
  //     ],
  //   ),
  //
  ],
  // errorBuilder: (context, state){
  //   return PageNotFoundView(
  //     errorMessage: state.error.toString(),
  //   );
  // }
);
