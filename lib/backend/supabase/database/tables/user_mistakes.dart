import '../database.dart';

class UserMistakesTable extends SupabaseTable<UserMistakesRow> {
  @override
  String get tableName => 'user_mistakes';

  @override
  UserMistakesRow createRow(Map<String, dynamic> data) => UserMistakesRow(data);
}

class UserMistakesRow extends SupabaseDataRow {
  UserMistakesRow(super.data);

  @override
  SupabaseTable get table => UserMistakesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get questionId => getField<int>('question_id');
  set questionId(int? value) => setField<int>('question_id', value);

  int? get mistakeCount => getField<int>('mistake_count');
  set mistakeCount(int? value) => setField<int>('mistake_count', value);

  DateTime? get lastMistakenAt => getField<DateTime>('last_mistaken_at');
  set lastMistakenAt(DateTime? value) =>
      setField<DateTime>('last_mistaken_at', value);
}
