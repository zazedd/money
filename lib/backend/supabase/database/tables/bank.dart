import '../database.dart';

class BankTable extends SupabaseTable<BankRow> {
  @override
  String get tableName => 'bank';

  @override
  BankRow createRow(Map<String, dynamic> data) => BankRow(data);
}

class BankRow extends SupabaseDataRow {
  BankRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BankTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  double? get total => getField<double>('total');
  set total(double? value) => setField<double>('total', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
