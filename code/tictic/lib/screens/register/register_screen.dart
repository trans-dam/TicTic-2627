import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/constants/colors.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/screens/main/main_screen.dart';
import 'package:tictic/screens/welcome/widgets/logo.dart';
import 'package:tictic/widgets/error_message.dart';

import '../../widgets/form/email_field.dart';
import '../../widgets/form/password_field.dart';
import '../../widgets/form/username_field.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  UsernameField(controller: usernameController),
                  SizedBox(height: kVerticalPaddingL),
                  EmailField(controller: emailController),
                  SizedBox(height: kVerticalPaddingL),
                  PasswordField(controller: passwordController),
                  SizedBox(height: kVerticalPaddingL),
                  ErrorMessage(message: message),
                  SizedBox(height: kVerticalPaddingL),
                  ElevatedButton(
                    onPressed: () async {
                      if (_registerFormKey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                          if (!context.mounted) return;
                          Navigator.pushNamed(context, MainScreen.routeName);
                        } on FirebaseAuthException catch (e) {
                          if (!context.mounted) return;
                          setState(() {
                            message = switch (e.code) {
                              'email-already-in-use' =>
                                'Cette adresse e-mail est déjà utilisée.',
                              'invalid-email' => 'Adresse e-mail invalide.',
                              'weak-password' =>
                                'Le mot de passe est trop faible.',
                              _ => 'La création du compte a échoué. Réessayez.',
                            };
                          });
                        }
                      }
                    },

                    child: Text('Créer mon compte'),
                  ),
                  Spacer(),
                  Text("Vous avez déjà un compte ?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: Text("Se connecter"),
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
