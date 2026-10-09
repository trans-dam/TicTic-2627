import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class Bullet extends StatelessWidget {
  final void Function()? onTap;

  final Color? color;

  final double? width;

  const Bullet({super.key, this.onTap, this.color, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: kVerticalPadding),
        height: kVerticalPaddingS,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        width:width,
      ),
    );
  }
}
