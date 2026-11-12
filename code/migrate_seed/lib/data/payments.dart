import 'dart:math';

import 'package:dto/Payment.dart';
import 'package:faker/faker.dart';

List<Payment> generatePayments() {
  final faker = Faker();
  final payments = <Payment>[];

  for (var i = 1; i <= 30; i++) {
    payments.add(
      Payment(
        id: faker.guid.guid(),
        name: faker.job.title(),
        creation: faker.date.dateTime(),
        amount: Random().nextInt(1000),
      ),
    );
  }

  return payments;
}
