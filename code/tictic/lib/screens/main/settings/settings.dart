import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../welcome/welcome_screen.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("On est sur l’écran settings..")),
        ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, WelcomeScreen.routeName);
          },
          child: Text("Se déconnecter"),
        )
      ],
    );
  }
}
