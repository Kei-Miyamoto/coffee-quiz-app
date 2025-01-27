import '../database.dart';

class ResultsTable extends SupabaseTable<ResultsRow> {
  @override
  String get tableName => 'results';

  @override
  ResultsRow createRow(Map<String, dynamic> data) => ResultsRow(data);
}

class ResultsRow extends SupabaseDataRow {
  ResultsRow(super.data);

  @override
  SupabaseTable get table => ResultsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  double? get score => getField<double>('score');
  set score(double? value) => setField<double>('score', value);

  double? get totalQuestions => getField<double>('total_questions');
  set totalQuestions(double? value) =>
      setField<double>('total_questions', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
