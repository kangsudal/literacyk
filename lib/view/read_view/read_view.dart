import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/models/custom_error.dart';
import 'package:literacyk/view/read_view/read_viewmodel.dart';
import 'package:literacyk/view/user_profile_view/user_profile_viewmodel.dart';

class ReadView extends ConsumerWidget {
  final String postId;

  const ReadView({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readViewState = ref.watch(readViewmodelProvider(postId));
    final readViewmodel = ref.read(readViewmodelProvider(postId).notifier);
    return readViewState.when(
      data: (post) {
        if (post == null) {
          return Scaffold(
            body: Center(
              child: Text('게시물이 존재하지 않습니다.'),
            ),
          );
        }
        final userNameState =
            ref.watch(userNameProvider(post.createdBy)); // 작성자 이름
        return Scaffold(
          appBar: AppBar(
            title: Text(post.title),
            actions: [
              if (fbAuth.currentUser!.uid == post.createdBy)
                PopupMenuButton(
                  icon: Icon(Icons.more_horiz),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Text('수정하기'),
                        onTap: () {
                          context.goNamed(
                            RouteNames.write,
                            queryParameters: {'postId': post.id},
                          );
                        },
                      ),
                      PopupMenuItem(
                        child: Text('삭제하기'),
                        onTap: () {
                          readViewmodel.deletePost(post.id);
                        },
                      ),
                    ];
                  },
                ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userNameState.when(
                  data: (name) => InkWell(
                    // onTap: () {
                    //   // 작성자 프로필로 이동
                    //   context.goNamed('profile',
                    //       pathParameters: {'uid': post.createdBy});
                    // },
                    child: Row(
                      children: [
                        Text(
                          'by. ',
                        ),
                        Text(
                          name,
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  loading: () => CircularProgressIndicator(),
                  error: (_, __) => Text('작성자 정보를 불러올 수 없습니다.'),
                ),
                Text(
                    '작성일: ${DateFormat('yyyy-mm-dd hh:mm a').format(post.createdAt)}'),
                Text(
                    '수정일: ${DateFormat('yyyy-mm-dd hh:mm a').format(post.updatedAt)}'),
                Divider(),
                Text(post.contents),
              ],
            ),
          ),
        );
      },
      error: (error, _) {
        CustomError e = error as CustomError;
        return Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                e.message,
              ),
              OutlinedButton(
                onPressed: () {
                  context.goNamed(RouteNames.home);
                },
                child: Text('Home'),
              ),
            ],
          ),
        ));
      },
      loading: () => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
