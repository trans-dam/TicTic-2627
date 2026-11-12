import 'package:firestore_odm/firestore_odm.dart';

part 'Payment.g.dart';

@firestoreOdm
class Payment {
  const Payment({
    required this.id,
    required this.name,
    required this.amount,
    required this.creation,
  });

  @DocumentIdField()
  final String id;
  final String name;
  final int amount;
  final DateTime creation;
}
