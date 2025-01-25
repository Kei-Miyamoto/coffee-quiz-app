import '../database.dart';

class QuestionsTable extends SupabaseTable<QuestionsRow> {
  @override
  String get tableName => 'questions';

  @override
  QuestionsRow createRow(Map<String, dynamic> data) => QuestionsRow(data);
}

class QuestionsRow extends SupabaseDataRow {
  QuestionsRow(super.data);

  @override
  SupabaseTable get table => QuestionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  int get categoryId => getField<int>('category_id')!;
  set categoryId(int value) => setField<int>('category_id', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
