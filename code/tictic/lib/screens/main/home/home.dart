import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tictic/screens/welcome/welcome_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("On est sur l’écran main..")),
        Center(child: Text(FirebaseAuth.instance.currentUser!.email ?? 'Rien')),
        ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, WelcomeScreen.routeName);
          },
          child: Text("Se déconnecter"),
        ),
      ],
    );
  }
}
