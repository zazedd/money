import '../database.dart';

class MatWorkTable extends SupabaseTable<MatWorkRow> {
  @override
  String get tableName => 'mat_work';

  @override
  MatWorkRow createRow(Map<String, dynamic> data) => MatWorkRow(data);
}

class MatWorkRow extends SupabaseDataRow {
  MatWorkRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MatWorkTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get workId => getField<int>('work_id');
  set workId(int? value) => setField<int>('work_id', value);

  int? get materialId => getField<int>('material_id');
  set materialId(int? value) => setField<int>('material_id', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  double? get weight => getField<double>('weight');
  set weight(double? value) => setField<double>('weight', value);
}
