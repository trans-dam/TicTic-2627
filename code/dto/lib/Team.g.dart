// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Team.dart';

// **************************************************************************
// ModelBuilderGenerator
// **************************************************************************

Map<String, dynamic>? TeamToJson(Team? instance) => instance == null
    ? null
    : {
        'id': instance.id,
        'name': instance.name,
        'tags': instance.tags,
        'creation': instance.creation,
      };
Team TeamFromJson(Map<String, dynamic> json) => Team(
  id: (json['id'] as String),
  name: (json['name'] as String),
  tags: (json['tags'] as List<dynamic>).cast<String>(),
  creation: dateTimeFromJson(json['creation']),
);

class TeamPatchBuilder extends PatchBuilder<Team> {
  /// Creates a patch builder for `Team`.
  TeamPatchBuilder({super.field});

  /// Patch handle for `name` (document field `name`).
  late final FieldUpdate<String> name = FieldUpdate(
    field: field.append('name'),
    toJson: (value) {
      return value;
    },
  );

  /// Patch handle for `tags` (document field `tags`).
  late final ListFieldUpdate<String> tags = ListFieldUpdate(
    field: field.append('tags'),
    toJson: (value) {
      return value;
    },
    elementToJson: (value) {
      return value;
    },
  );

  /// Patch handle for `creation` (document field `creation`).
  late final DateTimeFieldUpdate creation = DateTimeFieldUpdate(
    field: field.append('creation'),
    toJson: (value) {
      return value;
    },
  );

  /// Replaces the whole `Team` at [field].
  SetOperation set(Team value) => SetOperation(field, TeamToJson(value));

  /// Deletes the field at [field].
  DeleteOperation delete() => DeleteOperation(field);
}

class TeamFilterBuilder extends FilterBuilderRoot {
  TeamFilterBuilder({super.field});

  /// Selector for `id`.
  late final FilterField<String, String> id = FilterField<String, String>(
    field: append('id'),
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `name`.
  late final FilterField<String, String> name = FilterField<String, String>(
    field: append('name'),
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `tags`.
  late final FilterField<List<String>, String> tags =
      FilterField<List<String>, String>(
        field: append('tags'),
        toJson: (value) {
          return value;
        },
        elementToJson: (value) {
          return value;
        },
      );

  /// Selector for `creation`.
  late final FilterField<DateTime, DateTime> creation =
      FilterField<DateTime, DateTime>(
        field: append('creation'),
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

class TeamOrderByBuilder extends OrderByBuilderRoot {
  TeamOrderByBuilder({super.field, required OrderByContext context})
    : _context = context;

  final OrderByContext _context;

  /// Selector for `id`.
  late final OrderByField<String> id = OrderByField(
    field: append('id'),
    context: _context,
  );

  /// Selector for `name`.
  late final OrderByField<String> name = OrderByField(
    field: append('name'),
    context: _context,
  );

  /// Selector for `tags`.
  late final OrderByField<List<String>> tags = OrderByField(
    field: append('tags'),
    context: _context,
  );

  /// Selector for `creation`.
  late final OrderByField<DateTime> creation = OrderByField(
    field: append('creation'),
    context: _context,
  );

  /// The document ID pseudo-field.
  late final OrderByField<String> documentId = OrderByField(
    field: const DocumentIdNode(),
    context: _context,
  );
}

class TeamAggregateBuilder extends AggregateBuilderRoot {
  TeamAggregateBuilder({super.field, required AggregateContext context})
    : _context = context;

  final AggregateContext _context;

  @override
  int count() => _context.resolve(const CountOperation('count'));
}

class TeamPipelineSelector extends PipelineFieldNode {
  TeamPipelineSelector({super.components, super.context});

  /// Selector for `id`.
  late final PipelineField<String> id = PipelineField(
    components: [...components, 'id'],
    context: $ctx,
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `name`.
  late final PipelineField<String> name = PipelineField(
    components: [...components, 'name'],
    context: $ctx,
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `tags`.
  late final PipelineField<List<String>> tags = PipelineField(
    components: [...components, 'tags'],
    context: $ctx,
    toJson: (value) {
      return value;
    },
  );

  /// Selector for `creation`.
  late final PipelineField<DateTime> creation = PipelineField(
    components: [...components, 'creation'],
    context: $ctx,
    toJson: (value) {
      return value;
    },
  );
}

extension TeamPipelineExtension<S extends FirestoreSchema>
    on
        FirestoreCollection<
          S,
          Team,
          TeamPatchBuilder,
          TeamFilterBuilder,
          TeamOrderByBuilder,
          TeamAggregateBuilder
        > {
  TypedPipeline<Team, TeamPipelineSelector> pipeline() => TypedPipeline(
    ref.firestore.pipeline().collection(ref.path),
    TeamFromJson,
    'id',
    (context) => TeamPipelineSelector(context: context),
  );
}
