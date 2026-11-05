import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/screens/main/main_screen.dart';
import 'package:tictic/screens/register/register_screen.dart';
import 'package:tictic/screens/welcome/widgets/logo.dart';

import '../../constants/colors.dart';
import '../../widgets/error_message.dart';
import '../../widgets/form/email_field.dart';
import '../../widgets/form/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  late String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: kMainColor),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/back1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _registerFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(),
                  SizedBox(height: kVerticalPaddingXL),
                  EmailField(controller: emailController),
                  SizedBox(height: kVerticalPaddingL),
                  PasswordField(controller: passwordController),
                  SizedBox(height: kVerticalPaddingL),
                  ErrorMessage(message: message),
                  SizedBox(height: kVerticalPaddingL),
                  ElevatedButton(
                    onPressed: () async {
                      if (_registerFormKey.currentState!.validate()) {
                        if (kDebugMode) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          if (!context.mounted) return;
                          Navigator.pushNamed(context, MainScreen.routeName);
                        } on FirebaseAuthException catch (e) {
                          if (!context.mounted) return;
                          setState(() {
                            message = switch (e.code) {
                              'user-not-found' => 'Utilisateur non trouvé.',
                              'invalid-credential' => 'Identifiants invalides.',
                              _ => 'La connexion a échoué. Réessayez.',
                            };
                          });
                        }
                      }
                    },
                    child: Text('Se connecter'),
                  ),
                  Spacer(),
                  Text("Vous n'avez pas de compte ?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: Text("S'inscrire"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
