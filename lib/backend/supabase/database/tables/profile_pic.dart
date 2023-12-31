import '../database.dart';

class ProfilePicTable extends SupabaseTable<ProfilePicRow> {
  @override
  String get tableName => 'profile_pic';

  @override
  ProfilePicRow createRow(Map<String, dynamic> data) => ProfilePicRow(data);
}

class ProfilePicRow extends SupabaseDataRow {
  ProfilePicRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilePicTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get fileName => getField<String>('file_name');
  set fileName(String? value) => setField<String>('file_name', value);
}
