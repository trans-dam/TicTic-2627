import 'package:flutter/material.dart';

import '../../../constants/fonts.dart';
import '../../../constants/sizes.dart';

class TextSlide extends StatelessWidget {
  final String text;

  const TextSlide({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kVerticalPaddingL),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: kItalicText,
      ),
    );
  }
}
