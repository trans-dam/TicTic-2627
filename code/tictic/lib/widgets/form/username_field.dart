import 'package:flutter/material.dart';
import 'package:tictic/widgets/form/input_field.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key, this.controller});
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return InputField(
      label: 'Votre nom :',
      hintText: 'John Doe',
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().length < 2) {
          return 'Il faut renseigner une valeur pour le champ nom';
        }
        return null;
      },
      controller: controller,
    );
  }
}
