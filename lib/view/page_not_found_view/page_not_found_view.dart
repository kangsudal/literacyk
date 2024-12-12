import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/config/route_names.dart';

class PageNotFoundView extends StatelessWidget {
  final String errorMessage;
  const PageNotFoundView({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(errorMessage),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(RouteNames.home);
                },
                child: Text('홈으로 가기'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
