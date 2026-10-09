import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome/widgets/logo.dart';
import 'widgets/slider.dart' as my_slider;
import '../../constants/sizes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/back1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(height: kVerticalPaddingL),
              my_slider.Slider(),

            ],
          ),
        ),
      ),
    );
  }
}
