import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class TextDiver extends StatelessWidget {
  const TextDiver({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        spacing: kHorizontalPadding,
        children: [
          Expanded(child: Divider(thickness: 1)),
          Text(text),
          Expanded(child: Divider(thickness: 1)),
        ],
      ),
    );
  }
}
