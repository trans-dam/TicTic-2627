import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return message.isEmpty
        ? SizedBox()
        : Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: kErrorColor,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: kErrorColor,
            ),
          ),
        ),
      ],
    );
  }
}
