import 'package:dto/schema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:migrate_seed/data/teams.dart';

import 'data/payments.dart';
import 'data/users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirestoreODM(appSchema);
  final users = generateUsers();
  final teams = generateTeams();
  final payments = generatePayments();

  final List<String> _logs = [];
  final ScrollController _scrollController = ScrollController();
  bool _isSeeding = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _log(String message) {
    if (!mounted) return;
    setState(() => _logs.add(message));

    // Scroll vers le bas après le rendu de la nouvelle ligne
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  Future<void> _up() async {
    setState(() {
      _isSeeding = true;
      _logs.clear();
    });

    _log('> Démarrage de la création (${users.length} utilisateurs)');

    for (final user in users) {
      try {
        _log('> Création de ${user.email}...');
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: '1234567890',
        );
        await db.users.set(user);
        _log('  OK : ${user.firstName} ${user.lastName}');

        final selectedTeams = teams.toList()..shuffle();
        for (final team in selectedTeams.take(3)) {
          await db.usersTeams(user.email).set(team);
          _log(
            '  OK : Ajouter à l’utilisateur ${user.firstName} l’équipe ${team.name}',
          );
          final selectedPayments = payments.toList()..shuffle();
          for (final payment in selectedPayments.take(10)) {
            await db.usersTeamsPayments(user.email, team.id).set(payment);
            _log(
              '  OK : Ajouter à l’équipe ${team.name} le paiement ${payment.name}(${payment.amount / 100}€)',
            );
          }
        }
      } catch (error) {
        _log('  ERREUR : $error');
      }
    }

    _log('> Terminé.');
    if (mounted) setState(() => _isSeeding = false);
  }

  Future<void> _down() async {
    setState(() {
      _isSeeding = true;
      _logs.clear();
    });

    _log('> Recherche des utilisateurs dans Firestore...');
    final storedUsers = await db.users.get();
    _log('> Suppression des équipes de ${storedUsers.length} utilisateurs');

    for (final user in storedUsers) {
      try {
        final storedTeams = await db.usersTeams(user.email).get();
        for (final team in storedTeams) {
        _log('> Suppression de tous les paiements de l’équipe ${team.name}...');
          await db.usersTeamsPayments(user.email, team.id).deleteAll();
        _log('> OK : Suppression de tous les paiements de l’équipe ${team.name}...');
        }
        _log('> Suppression des équipes de ${user.email}...');
        await db.usersTeams(user.id).deleteAll();
        _log('  OK : équipes supprimées');
      } catch (error) {
        _log('  ERREUR : $error');
      }
    }

    _log('> Suppression des comptes Auth (${users.length} utilisateurs)');

    for (final user in users) {
      try {
        _log('> connexion au compte (auth) ${user.email}...');
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email,
          password: "1234567890",
        );
        _log('> Suppression du compte (auth) ${user.email}...');
        await FirebaseAuth.instance.currentUser?.delete();
      } catch (error) {
        _log('  ERREUR : $error');
      }
    }

    _log('> Suppression de tous les documents dans la collection users');

    await db.users.deleteAll();

    _log('> Terminé.');
    if (mounted) setState(() => _isSeeding = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Migrate & Seed')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              spacing: 15,
              children: [
                ElevatedButton(
                  onPressed: _isSeeding ? null : _up,
                  child: Text(_isSeeding ? 'En cours...' : 'Up'),
                ),
                ElevatedButton(
                  onPressed: _isSeeding ? null : _down,
                  child: Text(_isSeeding ? 'En cours...' : 'Down'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _logs.length,
                  itemBuilder: (context, index) => Text(
                    _logs[index],
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      color: Color(0xFF00FF7F),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
