import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/screens/main/main_screen.dart';
import 'package:tictic/widgets/form/input_field.dart';

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
                  InputField(
                    label: 'Votre nom :',
                    hintText: '',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 2) {
                        return 'Il faut renseigner une valeur pour le champ nom';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: kVerticalPaddingL),
                  InputField(
                    keyboardType: TextInputType.emailAddress,
                    label: 'Votre e-mail:',
                    hintText: '',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 2) {
                        return 'Il faut renseigner une valeur pour le champ email';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'Le champ email n’est pas valide';
                      }
                      return null;
                    },
                  ),
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
    ;
  }
}
