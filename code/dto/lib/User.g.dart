// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// ModelBuilderGenerator
// **************************************************************************

Map<String, dynamic>? UserToJson(User? instance) => instance == null
    ? null
    : {
        'id': instance.id,
        'firstName': instance.firstName,
        'lastName': instance.lastName,
        'email': instance.email,
      };
User UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as String),
  firstName: (json['firstName'] as String),
  lastName: (json['lastName'] as String),
  email: (json['email'] as String),
);

class UserPatchBuilder extends PatchBuilder<User> {
  /// Creates a patch builder for `User`.
  UserPatchBuilder({super.field});

  /// Patch handle for `firstName` (document field `firstName`).
  late final FieldUpdate<String> firstName = FieldUpdate(
    field: field.append('firstName'),
    toJson: (value) {
      return value;
    },
  );

  /// Patch handle for `lastName` (document field `lastName`).
  late final FieldUpdate<String> lastName = FieldUpdate(
    field: field.append('lastName'),
    toJson: (value) {
      return value;
    },
  );

  /// Patch handle for `email` (document field `email`).
  late final FieldUpdate<String> email = FieldUpdate(
    field: field.append('email'),
    toJson: (value) {
      return value;
    },
  );

  /// Replaces the whole `User` at [field].
  SetOperation set(User value) => SetOperation(field, UserToJson(value));

  /// Deletes the field at [field].
  DeleteOperation delete() => DeleteOperation(field);
}

class UserFilterBuilder extends FilterBuilderRoot {
  UserFilterBuilder({super.field});

  /// Selector for `id`.
  late final FilterField<String, String> id = FilterField<String, String>(
    field: append('id'),
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `firstName`.
  late final FilterField<String, String> firstName =
      FilterField<String, String>(
        field: append('firstName'),
        toJson: (value) {
          return value;
        },
      );

  /// Selector for `lastName`.
  late final FilterField<String, String> lastName = FilterField<String, String>(
    field: append('lastName'),
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `email`.
  late final FilterField<String, String> email = FilterField<String, String>(
    field: append('email'),
    toJson: (value) {
      return value;
    },
  );

  /// The document ID pseudo-field.
  late final FilterField<String, String> documentId =
      FilterField<String, String>(
        field: const DocumentIdNode(),
        toJson: (value) {
          return value;
        },
      );
}

class UserOrderByBuilder extends OrderByBuilderRoot {
  UserOrderByBuilder({super.field, required OrderByContext context})
    : _context = context;

  final OrderByContext _context;

  /// Selector for `id`.
  late final OrderByField<String> id = OrderByField(
    field: append('id'),
    context: _context,
  );

  /// Selector for `firstName`.
  late final OrderByField<String> firstName = OrderByField(
    field: append('firstName'),
    context: _context,
  );

  /// Selector for `lastName`.
  late final OrderByField<String> lastName = OrderByField(
    field: append('lastName'),
    context: _context,
  );

  /// Selector for `email`.
  late final OrderByField<String> email = OrderByField(
    field: append('email'),
    context: _context,
  );

  /// The document ID pseudo-field.
  late final OrderByField<String> documentId = OrderByField(
    field: const DocumentIdNode(),
    context: _context,
  );
}

class UserAggregateBuilder extends AggregateBuilderRoot {
  UserAggregateBuilder({super.field, required AggregateContext context})
    : _context = context;

  final AggregateContext _context;

  @override
  int count() => _context.resolve(const CountOperation('count'));
}

class UserPipelineSelector extends PipelineFieldNode {
  UserPipelineSelector({super.components, super.context});

  /// Selector for `id`.
  late final PipelineField<String> id = PipelineField(
    components: [...components, 'id'],
    context: $ctx,
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `firstName`.
  late final PipelineField<String> firstName = PipelineField(
    components: [...components, 'firstName'],
    context: $ctx,
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `lastName`.
  late final PipelineField<String> lastName = PipelineField(
    components: [...components, 'lastName'],
    context: $ctx,
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `email`.
  late final PipelineField<String> email = PipelineField(
    components: [...components, 'email'],
    context: $ctx,
    toJson: (value) {
      return value;
    },
  );
}

extension UserPipelineExtension<S extends FirestoreSchema>
    on
        FirestoreCollection<
          S,
          User,
          UserPatchBuilder,
          UserFilterBuilder,
          UserOrderByBuilder,
          UserAggregateBuilder
        > {
  TypedPipeline<User, UserPipelineSelector> pipeline() => TypedPipeline(
    ref.firestore.pipeline().collection(ref.path),
    UserFromJson,
    'id',
    (context) => UserPipelineSelector(context: context),
  );
}
