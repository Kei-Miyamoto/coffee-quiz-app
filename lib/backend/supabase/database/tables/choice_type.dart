import '../database.dart';

class ChoiceTypeTable extends SupabaseTable<ChoiceTypeRow> {
  @override
  String get tableName => 'choice_type';

  @override
  ChoiceTypeRow createRow(Map<String, dynamic> data) => ChoiceTypeRow(data);
}

class ChoiceTypeRow extends SupabaseDataRow {
  ChoiceTypeRow(super.data);

  @override
  SupabaseTable get table => ChoiceTypeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get typeName => getField<String>('type_name');
  set typeName(String? value) => setField<String>('type_name', value);
}
