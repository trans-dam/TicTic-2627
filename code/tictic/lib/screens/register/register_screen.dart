import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tictic/constants/colors.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/screens/main/main_screen.dart';
import 'package:tictic/screens/welcome/widgets/logo.dart';

import '../../widgets/form/email_field.dart';
import '../../widgets/form/password_field.dart';
import '../../widgets/form/username_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String routeName = '/register';

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
                  UsernameField(controller: usernameController),
                  SizedBox(height: kVerticalPaddingL),
                  EmailField(controller: emailController),
                  SizedBox(height: kVerticalPaddingL),
                  PasswordField(controller: passwordController),
                  SizedBox(height: kVerticalPaddingL),
                  ElevatedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        if (kDebugMode) {
                          print(usernameController.text);
                          print(emailController.text);
                          print(passwordController.text);
                        }
                        Navigator.pushNamed(context, MainScreen.routeName);
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
