import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/models/custom_error.dart';
import 'package:literacyk/view/verify_email_view/verify_email_viewmodel.dart';

class VerifyEmailView extends ConsumerStatefulWidget {
  const VerifyEmailView({super.key});

  @override
  ConsumerState<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends ConsumerState<VerifyEmailView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sendEmailVerification();
      //5초주기로 체크
      timer = Timer.periodic(Duration(seconds: 5), (timer) {
        checkEmailVerified();
      });
    });
  }

  Future<void> sendEmailVerification() async {
    try {
      await ref
          .read(verifyEmailViewmodelProvider.notifier)
          .sendEmailVerification();
    } on CustomError catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(e.message),
            actions: [
              CupertinoDialogAction(
                child: Text('확인'),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> checkEmailVerified() async {
    final goRouter = GoRouter.of(context);
    try {
      await ref
          .read(verifyEmailViewmodelProvider.notifier)
          .reloadUser(); // 이메일 인증이됐다면, 서버에서 업데이트됐으므로 클라이언트에서도 알 수 있게 갱신해야함.
      if (fbAuth.currentUser!.emailVerified == true) {
        timer?.cancel();
        goRouter.goNamed(RouteNames.home);
      }
    } on CustomError catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(e.message),
            actions: [
              CupertinoDialogAction(
                child: Text('확인'),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel(); // 타이머 종료
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'images/paperplane.png',
                width: 70,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '이메일 인증',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: '인증 이메일이 ',
                children: [
                  TextSpan(
                    text: fbAuth.currentUser?.email,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: '(으)로 전송되었습니다.'),
                ],
                style: TextStyle(color: Colors.black),
              ),
            ),
            Text('받으신 이메일을 열어 버튼을 클릭하면 가입이 완료됩니다.'),
            SizedBox(height: 30),
            OutlinedButton(
              onPressed: () async {
                try {
                  await ref
                      .read(verifyEmailViewmodelProvider.notifier)
                      .signout();
                } on CustomError catch (e) {
                  if (!mounted) return;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        content: Text(e.message),
                        actions: [
                          CupertinoDialogAction(
                            child: Text('확인'),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
