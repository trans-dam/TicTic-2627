// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// Generator: SchemaGenerator2
// **************************************************************************

extension AppSchemaFirestoreODMExtension on FirestoreODM<AppSchema> {
  FirestoreCollection<
    AppSchema,
    User,
    UserPatchBuilder,
    UserFilterBuilder,
    UserOrderByBuilder,
    UserAggregateBuilder
  >
  get users => FirestoreCollection(
    ref: firestore.collection('users'),
    toJson: (User value) {
      return UserToJson(value) ?? const <String, dynamic>{};
    },
    fromJson: UserFromJson,
    documentIdField: 'id',
    patchBuilderFactory: () => UserPatchBuilder(),
    filterBuilder: UserFilterBuilder(),
    orderByBuilderFunc: (context) => UserOrderByBuilder(context: context),
    aggregateBuilderFunc: (context) => UserAggregateBuilder(context: context),
  );

  FirestoreCollection<
    AppSchema,
    Team,
    TeamPatchBuilder,
    TeamFilterBuilder,
    TeamOrderByBuilder,
    TeamAggregateBuilder
  >
  usersTeams(String p1) => FirestoreCollection(
    ref: firestore.collection("users/${p1}/teams"),
    toJson: (Team value) {
      return TeamToJson(value) ?? const <String, dynamic>{};
    },
    fromJson: TeamFromJson,
    documentIdField: 'id',
    patchBuilderFactory: () => TeamPatchBuilder(),
    filterBuilder: TeamFilterBuilder(),
    orderByBuilderFunc: (context) => TeamOrderByBuilder(context: context),
    aggregateBuilderFunc: (context) => TeamAggregateBuilder(context: context),
  );

  FirestoreCollection<
    AppSchema,
    Payment,
    PaymentPatchBuilder,
    PaymentFilterBuilder,
    PaymentOrderByBuilder,
    PaymentAggregateBuilder
  >
  usersTeamsPayments(String p1, String p2) => FirestoreCollection(
    ref: firestore.collection("users/${p1}/teams/${p2}/payments"),
    toJson: (Payment value) {
      return PaymentToJson(value) ?? const <String, dynamic>{};
    },
    fromJson: PaymentFromJson,
    documentIdField: 'id',
    patchBuilderFactory: () => PaymentPatchBuilder(),
    filterBuilder: PaymentFilterBuilder(),
    orderByBuilderFunc: (context) => PaymentOrderByBuilder(context: context),
    aggregateBuilderFunc: (context) =>
        PaymentAggregateBuilder(context: context),
  );
}
