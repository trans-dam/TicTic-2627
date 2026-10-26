import 'package:flutter/material.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/screens/main/main_screen.dart';

import '../../widgets/form/email_field.dart';
import '../../widgets/form/password_field.dart';
import '../../widgets/form/username_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String routeName = '/register';

  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  UsernameField(),
                  SizedBox(height: kVerticalPaddingL),
                  EmailField(),
                  SizedBox(height: kVerticalPaddingL),
                  PasswordField(),
                  SizedBox(height: kVerticalPaddingL),
                  ElevatedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!.validate()) {
                        Navigator.pushNamed(context, MainScreen.routeName);
                      }
                    },
                    child: Text('Créer mon compte'),
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
