import 'package:datatable_plus/src/models/table_column_size.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_column.freezed.dart';

@freezed
class TableColumn<T> with _$TableColumn<T> {
  factory TableColumn({
    @Default(TableColumnSize.flex(1)) TableColumnSize size,
    required Widget label,
    required Widget Function(int, T) cellBuilder,
    @Default(false) bool canSort,
  }) = _TableColumn;
}
