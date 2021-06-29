import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart' hide TableRow;

import '../data_table_plus.dart';
import 'row.dart';

class TableBody<T> extends StatefulWidget {
  const TableBody({
    Key? key,
    required this.data,
    required this.scrollController,
  }) : super(key: key);

  final List<T> data;
  final ScrollController scrollController;

  @override
  _TableBodyState<T> createState() => _TableBodyState<T>();
}

class _TableBodyState<T> extends State<TableBody<T>> {
  List<Widget> getRows(bool flex, DataTablePlus<T> table) {
    final length =
        table.addEmptyRows ? table.source.rowsPerPage : widget.data.length;
    final rows = <Widget>[];

    for (var index = 0; index < length; index++) {
      final item = index >= widget.data.length ? null : widget.data[index];
      final textStyle = table.rowTextStyle?.call(index, item) ??
          DefaultTextStyle.of(context).style;

      final cells = List.generate(
        table.columns.length,
        (columnIndex) {
          Widget child;

          final column = table.columns[columnIndex];
          if (index >= widget.data.length) {
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

      bool canPressRow = item == null ? false : table.onRowPressed != null;

      Widget row = TableRow<T>(
        cells: List<Widget>.from(cells),
        index: index,
        item: item,
      );

      if (canPressRow) {
        row = GestureDetector(
          onTap: () => table.onRowPressed!(index, item),
          child: row,
        );
      }

      if (table.source.rowsExpandable) {
        final expandableKey = table.expandableKey!(index, item);

        row = SizedBox(
          width: flex ? null : table.scrollableTableWidth,
          child: ExpandablePanel(
            controller: table.source.expandableControllers.putIfAbsent(
              expandableKey,
              () => ExpandableController(
                initialExpanded: table.source.isFullyExpanded,
              ),
            ),
            collapsed: row,
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                row,
                table.expandedRow!(index, item),
              ],
            ),
          ),
        );
      }

      rows.add(row);
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final table = DataTablePlus.of<T>(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth < table.scrollableTableWidth) {
          return SingleChildScrollView(
            key: ValueKey(constraints.minWidth),
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            child: Column(
              children: getRows(false, table),
            ),
          );
        }
        return Column(
          children: getRows(true, table),
        );
      },
    );
  }
}
