import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/models/custom_error.dart';
import 'package:literacyk/models/post.dart';
import 'package:literacyk/view/board_view/board_view_model.dart';

class BoardViewInHomeView extends ConsumerStatefulWidget {
  const BoardViewInHomeView({super.key});

  @override
  ConsumerState<BoardViewInHomeView> createState() =>
      _BoardViewInHomeViewState();
}

class _BoardViewInHomeViewState extends ConsumerState<BoardViewInHomeView> {
  @override
  Widget build(BuildContext context) {
    final boardViewState = ref.watch(boardViewModelProvider);
    final boardViewmodel = ref.watch(boardViewModelProvider.notifier);
    return boardViewState.when(
      data: (posts) {
        if (posts.isEmpty) {
          return Align(
            alignment: const Alignment(0, -0.3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/pencil-img.png',
                  width: 150,
                  height: 150,
                ),
                Text(
                  '게시물을 작성해주세요!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.refresh(boardViewModelProvider.future),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.2),
            ),
            child: ListView.builder(
              // padding: EdgeInsets.zero,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post post = posts[index];
                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.4),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              post.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 80,
                              child: FutureBuilder<String>(
                                future: boardViewmodel
                                    .convertUidToName(post.createdBy),
                                builder: (context, snapshot) {
                                  final currentUid = fbAuth.currentUser!.uid;
                                  bool isMe = post.createdBy == currentUid;
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // 로딩 중 표시
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        snapshot.data ?? 'Unknown',
                                        style: TextStyle(
                                          color: isMe
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey,
                                        ),
                                      ),
                                    ); // 작성자 이름 표시
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Text(
                          DateFormat('yyyy-mm-dd hh:mm a')
                              .format(post.createdAt),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    context.goNamed(RouteNames.read, pathParameters: {
                      'postId': post.id,
                    });
                  },
                );
              },
            ),
          ),
        );
      },
      error: (error, _) {
        CustomError e = error as CustomError;
        return Text(e.message);
      },
      loading: () => CircularProgressIndicator(),
    );
  }
}
