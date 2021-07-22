import 'package:flutter/material.dart' hide TableRow;

import '../../datatable_plus.dart';
import 'row.dart';

class TableBody<T> extends StatelessWidget {
  const TableBody({
    Key? key,
    required this.data,
    required this.cellSizes,
    required this.columns,
    required this.page,
    required this.textStyle,
  }) : super(key: key);

  final List<T> data;
  final List<double> cellSizes;
  final List<TableColumn<T>> columns;
  final int page;
  final TextStyle? Function(int, T)? textStyle;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];

    for (var index = 0; index < data.length; index++) {
      final item = data[index];
      final realIndex = index + (page * data.length);

      final cells = List<Widget>.generate(
        columns.length,
        (columnIndex) {
          Widget child;

          final column = columns[columnIndex];
          if (index >= data.length) {
            child = const SizedBox.shrink();
          } else {
            child = Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DefaultTextStyle(
                style: textStyle?.call(realIndex, item) ??
                    DefaultTextStyle.of(context).style,
                child: column.cellBuilder(realIndex, item),
              ),
            );
          }

          return child;
        },
      );

      rows.add(
        TableRow<T>(
          key: ValueKey(realIndex),
          cells: cells,
          index: realIndex,
          item: item,
          sizes: cellSizes,
        ),
      );
    }

    return Column(
      children: rows,
    );
  }
}
