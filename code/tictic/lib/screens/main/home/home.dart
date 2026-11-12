import 'package:dto/Team.dart';
import 'package:dto/schema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/widgets/team_overview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirestoreODM(appSchema);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPaddingS),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(FirebaseAuth.instance.currentUser!.email!),
          Expanded(
            child: FirestoreBuilder<List<Team>>(
              ref: db.usersTeams(FirebaseAuth.instance.currentUser!.email!),
              builder: (context, snapshot, child) {
                if (snapshot.hasError) return Text('Erreur : ${snapshot.error}');
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView(
                  children: [for (final team in snapshot.data!) TeamOverview(team: team, db: db)],
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
