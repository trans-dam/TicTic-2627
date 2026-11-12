// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Payment.dart';

// **************************************************************************
// ModelBuilderGenerator
// **************************************************************************

Map<String, dynamic>? PaymentToJson(Payment? instance) => instance == null
    ? null
    : {
        'id': instance.id,
        'name': instance.name,
        'amount': instance.amount,
        'creation': instance.creation,
      };
Payment PaymentFromJson(Map<String, dynamic> json) => Payment(
  id: (json['id'] as String),
  name: (json['name'] as String),
  amount: (json['amount'] as int),
  creation: dateTimeFromJson(json['creation']),
);

class PaymentPatchBuilder extends PatchBuilder<Payment> {
  /// Creates a patch builder for `Payment`.
  PaymentPatchBuilder({super.field});

  /// Patch handle for `name` (document field `name`).
  late final FieldUpdate<String> name = FieldUpdate(
    field: field.append('name'),
    toJson: (value) {
      return value;
    },
  );

  /// Patch handle for `amount` (document field `amount`).
  late final NumericFieldUpdate<int> amount = NumericFieldUpdate(
    field: field.append('amount'),
    toJson: (value) {
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

  /// Replaces the whole `Payment` at [field].
  SetOperation set(Payment value) => SetOperation(field, PaymentToJson(value));

  /// Deletes the field at [field].
  DeleteOperation delete() => DeleteOperation(field);
}

class PaymentFilterBuilder extends FilterBuilderRoot {
  PaymentFilterBuilder({super.field});

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

  /// Selector for `amount`.
  late final FilterField<int, int> amount = FilterField<int, int>(
    field: append('amount'),
    toJson: (value) {
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

class PaymentOrderByBuilder extends OrderByBuilderRoot {
  PaymentOrderByBuilder({super.field, required OrderByContext context})
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

  /// Selector for `amount`.
  late final OrderByField<int> amount = OrderByField(
    field: append('amount'),
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

class PaymentAggregateBuilder extends AggregateBuilderRoot {
  PaymentAggregateBuilder({super.field, required AggregateContext context})
    : _context = context;

  final AggregateContext _context;

  /// Selector for `amount`.
  late final AggregateFieldSelector<int> amount = AggregateFieldSelector(
    field: append('amount'),
    context: _context,
  );

  @override
  int count() => _context.resolve(const CountOperation('count'));
}

class PaymentPipelineSelector extends PipelineFieldNode {
  PaymentPipelineSelector({super.components, super.context});

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

  /// Selector for `amount`.
  late final PipelineField<int> amount = PipelineField(
    components: [...components, 'amount'],
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

extension PaymentPipelineExtension<S extends FirestoreSchema>
    on
        FirestoreCollection<
          S,
          Payment,
          PaymentPatchBuilder,
          PaymentFilterBuilder,
          PaymentOrderByBuilder,
          PaymentAggregateBuilder
        > {
  TypedPipeline<Payment, PaymentPipelineSelector> pipeline() => TypedPipeline(
    ref.firestore.pipeline().collection(ref.path),
    PaymentFromJson,
    'id',
    (context) => PaymentPipelineSelector(context: context),
  );
}
