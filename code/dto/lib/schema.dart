import 'package:firestore_odm/firestore_odm.dart';

import 'Payment.dart';
import 'Team.dart';
import 'User.dart';

part 'schema.g.dart';

class AppSchema extends FirestoreSchema {
  const AppSchema();
}

@Schema()
@Collection<User>('users')
@Collection<Team>('users/*/teams')
@Collection<Payment>('users/*/teams/*/payments')
const appSchema = AppSchema();
