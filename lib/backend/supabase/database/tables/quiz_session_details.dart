import '../database.dart';

class QuizSessionDetailsTable extends SupabaseTable<QuizSessionDetailsRow> {
  @override
  String get tableName => 'quiz_session_details';

  @override
  QuizSessionDetailsRow createRow(Map<String, dynamic> data) =>
      QuizSessionDetailsRow(data);
}

class QuizSessionDetailsRow extends SupabaseDataRow {
  QuizSessionDetailsRow(super.data);

  @override
  SupabaseTable get table => QuizSessionDetailsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double? get sessionId => getField<double>('session_id');
  set sessionId(double? value) => setField<double>('session_id', value);

  double? get questionId => getField<double>('question_id');
  set questionId(double? value) => setField<double>('question_id', value);

  String? get userAnswer => getField<String>('user_answer');
  set userAnswer(String? value) => setField<String>('user_answer', value);

  bool? get isCorrect => getField<bool>('is_correct');
  set isCorrect(bool? value) => setField<bool>('is_correct', value);

  DateTime? get answeredAt => getField<DateTime>('answered_at');
  set answeredAt(DateTime? value) => setField<DateTime>('answered_at', value);
}
