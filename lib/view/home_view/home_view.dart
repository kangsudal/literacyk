import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/view/board_view/board_view_in_home_view.dart';
import 'package:literacyk/view/user_profile_view/user_profile_view_in_home_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: Column(
          children: [
            UserProfileViewInHomeView(),
            Expanded(child: BoardViewInHomeView(),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.goNamed(RouteNames.);
        },
        child: Icon(Icons.edit_note_outlined),
      ),
    );
  }
}
