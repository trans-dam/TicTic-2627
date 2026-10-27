import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/screens/main/main_screen.dart';
import 'package:tictic/screens/register/register_screen.dart';
import 'package:tictic/screens/welcome/widgets/logo.dart';

import '../../constants/colors.dart';
import '../../widgets/form/email_field.dart';
import '../../widgets/form/password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String routeName = '/login';

  final _registerFormKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                  ElevatedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        if (kDebugMode) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                        Navigator.pushNamed(context, MainScreen.routeName);
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
