import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("On est sur l’écran main..")),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Retour en arrière"),
        ),
      ],
    );
  }
}
