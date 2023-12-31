import '../database.dart';

class WorkTable extends SupabaseTable<WorkRow> {
  @override
  String get tableName => 'work';

  @override
  WorkRow createRow(Map<String, dynamic> data) => WorkRow(data);
}

class WorkRow extends SupabaseDataRow {
  WorkRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WorkTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  double? get budget => getField<double>('budget');
  set budget(double? value) => setField<double>('budget', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get startsAt => getField<DateTime>('starts_at');
  set startsAt(DateTime? value) => setField<DateTime>('starts_at', value);

  DateTime? get endsAt => getField<DateTime>('ends_at');
  set endsAt(DateTime? value) => setField<DateTime>('ends_at', value);

  double? get usedBudget => getField<double>('used_budget');
  set usedBudget(double? value) => setField<double>('used_budget', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);
}
