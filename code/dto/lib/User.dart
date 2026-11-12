import 'package:firestore_odm/firestore_odm.dart';

part 'User.g.dart';

@firestoreOdm
class User {
  const User({required this.id, required this.firstName, required this.lastName, required this.email});

  @DocumentIdField()
  final String id;
  final String firstName;
  final String lastName;
  final String email;
}
