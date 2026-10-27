import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'input_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, this.controller});
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return InputField(
      keyboardType: TextInputType.emailAddress,
      label: 'Votre e-mail :',
      hintText: 'john@doe.be',
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().length < 2) {
          return 'Il faut renseigner une valeur pour le champ email';
        }
        if (!EmailValidator.validate(value)) {
          return 'Le champ email n’est pas valide';
        }
        return null;
      },
      controller: controller,
    );
  }
}
