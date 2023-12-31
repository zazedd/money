import '../database.dart';

class TaskTable extends SupabaseTable<TaskRow> {
  @override
  String get tableName => 'task';

  @override
  TaskRow createRow(Map<String, dynamic> data) => TaskRow(data);
}

class TaskRow extends SupabaseDataRow {
  TaskRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TaskTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get workId => getField<int>('work_id');
  set workId(int? value) => setField<int>('work_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get startsAt => getField<DateTime>('starts_at');
  set startsAt(DateTime? value) => setField<DateTime>('starts_at', value);

  DateTime? get endsAt => getField<DateTime>('ends_at');
  set endsAt(DateTime? value) => setField<DateTime>('ends_at', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
