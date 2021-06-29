import 'package:flutter/material.dart';

import '../data_table_plus.dart';
import '../data_table_plus_theme.dart';

class TableRow<T> extends StatefulWidget {
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
  _TableRowState<T> createState() => _TableRowState<T>();
}

class _TableRowState<T> extends State<TableRow<T>> {
  late Color color;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    color = DataTablePlus.of<T>(context)!
            .rowColor
            ?.call(widget.index, widget.item) ??
        Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final theme = DataTablePlusThemeData.of(context);
    final table = DataTablePlus.of<T>(context)!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (d) {
            color = table.rowHoverColor?.call(widget.index, widget.item) ??
                table.rowColor?.call(widget.index, widget.item) ??
                Colors.transparent;

            setState(() {});
          },
          onExit: (d) {
            color = table.rowColor?.call(widget.index, widget.item) ??
                Colors.transparent;

            setState(() {});
          },
          child: AnimatedContainer(
            duration: theme.rowHoverTransitionDuration,
            height: theme.rowHeight,
            color: color,
            child: Row(
              children: widget.cells,
            ),
          ),
        );
      },
    );
  }
}
