import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_column_size.freezed.dart';

@freezed
class TableColumnSize with _$TableColumnSize {
  const factory TableColumnSize.flex(int flex) = FlexTableColumn;
  const factory TableColumnSize.fixed(double size) = FixedTableColumn;
}
