import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/models/custom_error.dart';
import 'package:literacyk/view/user_profile_view/user_profile_viewmodel.dart';

class UserProfileViewInHomeView extends ConsumerWidget {
  const UserProfileViewInHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = fbAuth.currentUser!.uid; // 인증이 되어야만 접근할 수 있는 페이지기때문에 !
    final userProfileViewState = ref.watch(userProfileViewmodelProvider(uid));
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
      ),
      title: userProfileViewState.when(
        data: (appUser) => Text('어서오세요 ${appUser.name}님'),
        error: (error, _) {
          CustomError e = error as CustomError;
          Text(e.message);
        },
        loading: () => CircularProgressIndicator(),
      ),
      trailing: IconButton(
        onPressed: () async {
          try {
            await ref
                .read(userProfileViewmodelProvider(uid).notifier)
                .signout();
          } on CustomError catch (e) {
            if (!context.mounted) return;
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
        icon: Icon(Icons.login_outlined),
      ),
    );
  }
}
