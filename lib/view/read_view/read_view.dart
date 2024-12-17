import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/models/custom_error.dart';
import 'package:literacyk/view/read_view/read_viewmodel.dart';

class ReadView extends ConsumerWidget {
  final String postId;

  const ReadView({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readViewState = ref.watch(readViewmodelProvider(postId));
    return readViewState.when(
      data: (post) {
        if (post == null) {
          return Scaffold(
            body: Center(
              child: Text('게시물이 존재하지 않습니다.'),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(post.title),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
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
