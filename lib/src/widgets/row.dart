import 'package:flutter/material.dart';

import '../data_table_plus.dart';
import '../data_table_plus_theme.dart';

class TableRow<T> extends StatelessWidget {
  final int index;
  final T? item;
  final List<Widget> cells;
  const TableRow({
    Key? key,
    required this.index,
    required this.cells,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DataTablePlusThemeData.of(context);
    final table = DataTablePlus.of<T>(context)!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: theme.rowHeight,
          decoration: BoxDecoration(
            color: table.rowColor?.call(index, item) ?? Colors.transparent,
          ),
          child: Row(
            children: cells,
          ),
        );
      },
    );
  }
}
