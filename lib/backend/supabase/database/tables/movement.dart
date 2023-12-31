import '../database.dart';

class MovementTable extends SupabaseTable<MovementRow> {
  @override
  String get tableName => 'movement';

  @override
  MovementRow createRow(Map<String, dynamic> data) => MovementRow(data);
}

class MovementRow extends SupabaseDataRow {
  MovementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MovementTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  double? get cost => getField<double>('cost');
  set cost(double? value) => setField<double>('cost', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get matWorkId => getField<int>('mat_work_id');
  set matWorkId(int? value) => setField<int>('mat_work_id', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  bool? get isStocked => getField<bool>('is_stocked');
  set isStocked(bool? value) => setField<bool>('is_stocked', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
