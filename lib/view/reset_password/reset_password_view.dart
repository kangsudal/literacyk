import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/models/custom_error.dart';
import 'package:literacyk/view/reset_password/reset_password_viewmodel.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  const ResetPasswordView({super.key});

  @override
  ConsumerState<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends ConsumerState<ResetPasswordView> {
  String? email;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(
      resetPasswordViewmodelProvider,
      (preview, next) {
        dialogErrorAndSuccessSnackBar(next, context);
      },
    );
    final resetPwdState = ref.watch(resetPasswordViewmodelProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 50,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Spacer(),
                Text('당신의 건강 도우미'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '리터러시',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        'K',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '이메일',
                    hintText: 'example@kangsudal.com',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력하세요';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return '올바른 이메일 형식을 입력하세요';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      submit(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      '이메일 재설정 메일 보내기',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('비밀번호가 기억이 나셨나요? '),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                      ),
                      onPressed: () {
                        context.goNamed(RouteNames.signin);
                      },
                      child: Text(' 로그인 하기'),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dialogErrorAndSuccessSnackBar(
      AsyncValue<void> next, BuildContext context) {
    return next.whenOrNull(
      error: (e, _) {
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              content: Text((e as CustomError).message),
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
      },
      data: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('이메일이 전송됐습니다.'),
          ),
        );
        GoRouter.of(context).goNamed(RouteNames.signin);
      },
    );
  }

  Future<void> submit(BuildContext context) async {
    final resetPasswordViewmodel =
        ref.read(resetPasswordViewmodelProvider.notifier);
    final form = formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    try {
      await resetPasswordViewmodel.resetPassword(email: email!);
    } on CustomError catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
