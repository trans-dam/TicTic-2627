import 'package:dto/Team.dart';
import 'package:faker/faker.dart';

List<Team> generateTeams() {
  final faker = Faker();
  final teams = <Team>[];

  for (var i = 1; i <= 10; i++) {
    teams.add(
      Team(
        id: faker.guid.guid(),
        name: faker.internet.domainName(),
        tags: [faker.lorem.word(), faker.lorem.word(), faker.lorem.word()],
        creation: DateTime.now(),
      ),
    );
  }

  return teams;
}
