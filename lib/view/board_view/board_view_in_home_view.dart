import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        return ListView.builder(
          itemBuilder: (context, index) {
            Post post = posts[index];
            return ListTile(
              title: Text(post.title),
            );
          },
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
