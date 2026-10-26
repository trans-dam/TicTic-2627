import 'package:flutter/material.dart';
import 'package:tictic/widgets/form/input_field.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: 'Votre nom :',
      hintText: '',
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().length < 2) {
          return 'Il faut renseigner une valeur pour le champ nom';
        }
        return null;
      },
    );
  }
}
