import 'package:flutter/material.dart' hide TableRow;

import '../data_table_plus.dart';
import 'row.dart';

class TableBody<T> extends StatelessWidget {
  const TableBody({
    Key? key,
    required this.data,
    required this.scrollController,
  }) : super(key: key);

  final List<T> data;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final table = DataTablePlus.of<T>(context)!;

    List<Widget> getRows(bool flex) {
      final length =
          table.addEmptyRows ? table.source.rowsPerPage : data.length;
      final rows = <Widget>[];

      for (var index = 0; index < length; index++) {
        final item = index >= data.length ? null : data[index];
        final textStyle = table.rowTextStyle?.call(index, item) ??
            DefaultTextStyle.of(context).style;

        final cells = List.generate(
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

            return column.size.when(
              flex: (flexFactor) => flex
                  ? Expanded(
                      flex: flexFactor,
                      child: child,
                    )
                  : SizedBox(
                      width: table.scrollableCellWidth,
                      child: child,
                    ),
              fixed: (size) => SizedBox(
                width: size,
                child: child,
              ),
            );
          },
        );

        rows.add(
          TableRow<T>(
            cells: List<Widget>.from(cells),
            index: index,
            item: item,
            flex: flex,
          ),
        );
      }
      return rows;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth < table.scrollableTableWidth) {
          return SingleChildScrollView(
            key: ValueKey(constraints.minWidth),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Column(
              children: getRows(false),
            ),
          );
        }
        return Column(
          children: getRows(true),
        );
      },
    );
  }
}
