import 'package:firestore_odm/firestore_odm.dart';

part 'Team.g.dart';

@firestoreOdm
class Team {
  const Team({
    required this.id,
    required this.name,
    required this.tags,
    required this.creation,
  });

  @DocumentIdField()
  final String id;
  final String name;
  final List<String> tags;
  final DateTime creation;
}
