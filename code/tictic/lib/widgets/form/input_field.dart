import 'package:flutter/material.dart';

import '../../constants/fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    required this.label,
    required this.hintText,
  });

  final String? Function(String?)? validator;

  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label, style: kLabelStyle),
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: validator,
    );
  }
}
