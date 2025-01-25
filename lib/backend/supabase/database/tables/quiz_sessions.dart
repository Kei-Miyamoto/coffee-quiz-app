import '../database.dart';

class QuizSessionsTable extends SupabaseTable<QuizSessionsRow> {
  @override
  String get tableName => 'quiz_sessions';

  @override
  QuizSessionsRow createRow(Map<String, dynamic> data) => QuizSessionsRow(data);
}

class QuizSessionsRow extends SupabaseDataRow {
  QuizSessionsRow(super.data);

  @override
  SupabaseTable get table => QuizSessionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get mode => getField<int>('mode');
  set mode(int? value) => setField<int>('mode', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  DateTime? get compleatedAt => getField<DateTime>('compleated_at');
  set compleatedAt(DateTime? value) =>
      setField<DateTime>('compleated_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
