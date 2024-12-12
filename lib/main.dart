import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:literacyk/config/router.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'LiteracyK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFd84848),
          primary: Color(0xFFd84848),
        ),
        useMaterial3: true,
      ),
      routerConfig: myRouter,
    );
  }
}
