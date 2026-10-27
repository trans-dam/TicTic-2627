import 'package:flutter/material.dart';
import 'package:tictic/screens/main/main_screen.dart' show MainScreen;
import 'package:tictic/screens/register/login_screen.dart';
import 'package:tictic/screens/register/register_screen.dart';
import 'package:tictic/screens/welcome/welcome_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};
