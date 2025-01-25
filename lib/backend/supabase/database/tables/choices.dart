import '../database.dart';

class ChoicesTable extends SupabaseTable<ChoicesRow> {
  @override
  String get tableName => 'choices';

  @override
  ChoicesRow createRow(Map<String, dynamic> data) => ChoicesRow(data);
}

class ChoicesRow extends SupabaseDataRow {
  ChoicesRow(super.data);

  @override
  SupabaseTable get table => ChoicesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  bool? get isAnswer => getField<bool>('is_answer');
  set isAnswer(bool? value) => setField<bool>('is_answer', value);

  int? get questionId => getField<int>('question_id');
  set questionId(int? value) => setField<int>('question_id', value);

  int? get choiceTypeId => getField<int>('choice_type_id');
  set choiceTypeId(int? value) => setField<int>('choice_type_id', value);
}
