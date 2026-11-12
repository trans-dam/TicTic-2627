import 'package:dto/Payment.dart';
import 'package:dto/Team.dart';
import 'package:dto/schema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/widgets/tags.dart';

import '../constants/colors.dart';

class TeamOverview extends StatelessWidget {
  const TeamOverview({super.key, required this.team, required this.db});

  final Team team;
  final FirestoreODM<AppSchema> db;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kVerticalPadding),
      child: Card(
        color: kBackgroundColorCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusS),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(team.name, style: textTheme.titleLarge),
              const SizedBox(height: kVerticalPaddingXS),
              Text(
                'Créée le ${_formatDate(team.creation)}',
                style: textTheme.bodySmall?.copyWith(color: kGreyColor),
              ),
              Tags(tags: team.tags),
              const Divider(height: kVerticalPaddingL, color: kTertiaryColor),
              Text('Derniers paiements', style: textTheme.titleMedium),
              const SizedBox(height: kVerticalPaddingS),
              FirestoreBuilder<List<Payment>>(
                ref: db
                    .usersTeamsPayments(
                      FirebaseAuth.instance.currentUser!.email!,
                      team.id,
                    )
                    .orderBy(($) => ($.creation(descending: true),))
                    .limit(5),
                builder: (context, snapshot, child) {
                  if (snapshot.hasError) {
                    return Text(
                      'Erreur : ${snapshot.error}',
                      style: textTheme.bodyMedium?.copyWith(color: kErrorColor),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final payments = snapshot.data!;
                  if (payments.isEmpty) {
                    return Text(
                      'Aucun paiement.',
                      style: textTheme.bodyMedium?.copyWith(color: kGreyColor),
                    );
                  }
                  return Column(
                    children: [
                      for (final payment in payments)
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(payment.name),
                          subtitle: Text(
                            _formatDate(payment.creation),
                            style: textTheme.bodySmall?.copyWith(
                              color: kGreyColor,
                            ),
                          ),
                          trailing: Text('${payment.amount} €'),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _formatDate(DateTime date) {
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  return '$day/$month/${date.year}';
}
