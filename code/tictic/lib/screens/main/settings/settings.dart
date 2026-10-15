import 'package:flutter/material.dart';

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
            Navigator.pop(context);
          },
          child: Text("Retour en arrière"),
        ),
      ],
    );
  }
}
