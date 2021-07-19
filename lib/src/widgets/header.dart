import 'package:flutter/material.dart';

import '../../datatable_plus.dart';
import '../data_table_plus.dart';
import '../data_table_plus_theme.dart';

class TableHeader<T> extends StatelessWidget {
  const TableHeader({Key? key, required this.cellSizes}) : super(key: key);

  final List<double> cellSizes;

  @override
  Widget build(BuildContext context) {
    final table = DataTablePlus.of<T>(context)!;
    final theme = DataTablePlusThemeData.of(context);

    final cells = List<Widget>.generate(
      table.columns.length,
      (index) {
        final column = table.columns[index];
        Widget child = column.label;

        if (column.canSort) {
          child = InkWell(
            child: Row(
              children: [
                Flexible(
                  child: child,
                ),
                if (index == table.source.sortColumnIndex)
                  Icon((table.source.sortAscending ?? false)
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down)
              ],
            ),
            onTap: () {
              table.source.sort(
                index,
                !(table.source.sortAscending ?? false),
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
