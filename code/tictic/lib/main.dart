import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tictic/constants/colors.dart';
import 'package:tictic/routes.dart';
import 'package:tictic/screens/welcome/welcome_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
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
    return MaterialApp(
      title: 'TicTic',
      theme: appTheme,
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
