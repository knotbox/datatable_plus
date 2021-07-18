import 'package:flutter/material.dart' hide TableRow;
import '../../datatable_plus.dart';
import '../data_table_plus.dart';
import 'row.dart';

class TableBody<T> extends StatelessWidget {
  const TableBody({
    Key? key,
    required this.data,
    required this.maxWidth,
    required this.cellSizes,
  }) : super(key: key);

  final List<T> data;
  final double maxWidth;
  final List<double> cellSizes;

  @override
  Widget build(BuildContext context) {
    final table = DataTablePlus.of<T>(context)!;

    final length = table.addEmptyRows ? table.source.rowsPerPage : data.length;
    final rows = <Widget>[];

    for (var index = 0; index < length; index++) {
      final item = index >= data.length ? null : data[index];
      final realIndex = index + (table.source.page * length);
      final textStyle = table.rowTextStyle?.call(realIndex, item) ??
          DefaultTextStyle.of(context).style;

      final cells = List<Widget>.generate(
        table.columns.length,
        (columnIndex) {
          Widget child;

          final column = table.columns[columnIndex];
          if (index >= data.length) {
            child = const SizedBox.shrink();
          } else {
            child = Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DefaultTextStyle(
                style: textStyle,
                child: column.cellBuilder(item!),
              ),
            );
          }

          return child;
        },
      );

      rows.add(
        TableRow<T>(
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
