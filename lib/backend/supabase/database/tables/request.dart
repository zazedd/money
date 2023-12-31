import '../database.dart';

class RequestTable extends SupabaseTable<RequestRow> {
  @override
  String get tableName => 'request';

  @override
  RequestRow createRow(Map<String, dynamic> data) => RequestRow(data);
}

class RequestRow extends SupabaseDataRow {
  RequestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RequestTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get workId => getField<int>('work_id');
  set workId(int? value) => setField<int>('work_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);
}
