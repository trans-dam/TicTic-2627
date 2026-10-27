import 'package:flutter/material.dart';
import 'package:tictic/screens/main/main_screen.dart';
import 'package:tictic/screens/register/register_screen.dart';
import 'package:tictic/screens/welcome/widgets/logo.dart';
import 'package:tictic/screens/welcome/widgets/text_diver.dart';

import '../register/login_screen.dart';
import 'widgets/slider.dart' as my_slider;
import '../../constants/sizes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static String routeName = '/welcome';

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
              Spacer(),
              Logo(),
              Spacer(),
              SizedBox(height: kVerticalPaddingL),
              my_slider.Slider(),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MainScreen.routeName);
                },
                child: Text("Continuer sans compte"),
              ),
              SizedBox(height: kVerticalPadding),
              TextDiver(text: 'Ou'),
              SizedBox(height: kVerticalPadding),
              LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RegisterScreen.routeName,
                              );
                            },
                            child: Text('Créer un compte'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginScreen.routeName);
                            },
                            child: Text('Se connecter'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
