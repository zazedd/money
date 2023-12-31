import '../database.dart';

class FundsBankTable extends SupabaseTable<FundsBankRow> {
  @override
  String get tableName => 'funds_bank';

  @override
  FundsBankRow createRow(Map<String, dynamic> data) => FundsBankRow(data);
}

class FundsBankRow extends SupabaseDataRow {
  FundsBankRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FundsBankTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get bankId => getField<int>('bank_id');
  set bankId(int? value) => setField<int>('bank_id', value);

  double? get quant => getField<double>('quant');
  set quant(double? value) => setField<double>('quant', value);

  String? get desc => getField<String>('desc');
  set desc(String? value) => setField<String>('desc', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
