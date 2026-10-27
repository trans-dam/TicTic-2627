import 'package:flutter/material.dart';

import 'input_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return InputField(
      keyboardType: TextInputType.visiblePassword,
      label: 'Votre mot de passe:',
      obscureText: true,
      hintText: '',
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().length < 2) {
          return 'Il faut renseigner une valeur pour le champ mot de passe';
        }
        return null;
      },
      controller: controller,
    );
  }
}
