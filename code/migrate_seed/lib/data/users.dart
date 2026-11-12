import 'package:dto/User.dart';
import 'package:faker/faker.dart';

List<User> generateUsers() {
  final faker = Faker();
  final users = <User>[];

  for (var i = 1; i <= 10; i++) {
    users.add(
      User(
        id: "$i@test.com",
        firstName: faker.person.firstName(),
        lastName: faker.person.lastName(),
        email: "$i@test.com",
      ),
    );
  }

  return users;
}
