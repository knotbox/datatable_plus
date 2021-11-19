import 'package:flutter/material.dart';

import '../../datatable_plus.dart';

class TableHeader extends StatelessWidget {
  final DataTablePlusSource source;
  final List<TableColumn> columns;
  const TableHeader(
      {Key? key,
      required this.cellSizes,
      required this.source,
      required this.columns})
      : super(key: key);

  final List<double> cellSizes;

  @override
  Widget build(BuildContext context) {
    final theme = DataTablePlusThemeData.of(context);

    final cells = List<Widget>.generate(
      columns.length,
      (index) {
        final column = columns[index];
        Widget child = column.label;

        if (column.canSort) {
          child = InkWell(
            child: Row(
              children: [
                Flexible(
                  child: child,
                ),
                if (index == source.sortColumnIndex)
                  Icon((source.sortAscending ?? false)
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down)
              ],
            ),
            onTap: () {
              source.sort(
                index,
                !(source.sortAscending ?? false),
              );
            },
          );
        }

        child = Container(
          height: theme.rowHeight,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          alignment: Alignment.centerLeft,
          child: child,
        );

        return SizedBox(
          width: cellSizes[index],
          child: child,
        );
      },
    );

    return DefaultTextStyle(
      style: theme.headerRowTextStyle ?? DefaultTextStyle.of(context).style,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.headerRowColor ?? Colors.transparent,
        ),
        child: Row(
          children: cells,
        ),
      ),
    );
  }
}
