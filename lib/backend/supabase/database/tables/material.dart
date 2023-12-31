import '../database.dart';

class MaterialTable extends SupabaseTable<MaterialRow> {
  @override
  String get tableName => 'material';

  @override
  MaterialRow createRow(Map<String, dynamic> data) => MaterialRow(data);
}

class MaterialRow extends SupabaseDataRow {
  MaterialRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MaterialTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get isUnits => getField<bool>('is_units');
  set isUnits(bool? value) => setField<bool>('is_units', value);

  String? get dimension => getField<String>('dimension');
  set dimension(String? value) => setField<String>('dimension', value);

  double? get cost => getField<double>('cost');
  set cost(double? value) => setField<double>('cost', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);
}
