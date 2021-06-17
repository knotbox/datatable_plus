import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_value.freezed.dart';

@freezed
class TableValue<T> with _$TableValue<T> {
  const factory TableValue.data(List<T> data) = TableData;
  const factory TableValue.loading() = TableLoading;
  const factory TableValue.empty() = TableEmpty;
  const factory TableValue.error(Object err) = TableError;
}
