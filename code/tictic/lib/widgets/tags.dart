import 'package:flutter/material.dart';
import 'package:tictic/constants/fonts.dart';
import 'package:tictic/constants/sizes.dart';

import '../constants/colors.dart';

class Tags extends StatelessWidget {
  const Tags({super.key, required this.tags});
  final List<String> tags;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: tags.map((tag) {
        return Padding(
          padding: const EdgeInsets.only(right: kHorizontalPaddingXS),
          child: Text(
            '#$tag',
            style: kTagStyle,
          ),
        );
      }).toList(),
    );
  }
}
