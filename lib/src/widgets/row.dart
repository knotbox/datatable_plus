import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../data_table_plus.dart';
import '../data_table_plus_theme.dart';

class TableRow<T> extends StatefulWidget {
  final int index;
  final T? item;
  final List<Widget> cells;
  final bool flex;
  const TableRow({
    Key? key,
    required this.index,
    required this.cells,
    required this.item,
    required this.flex,
  }) : super(key: key);

  @override
  _TableRowState<T> createState() => _TableRowState<T>();
}

class _TableRowState<T> extends State<TableRow<T>> {
  late Color color;
  final key = GlobalKey<SlidableState>();
  var isSelected = false;
  var isHovered = false;
  late DataTablePlus<T> table;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    table = DataTablePlus.of<T>(context)!;
    color =
        table.rowColor?.call(widget.index, widget.item) ?? Colors.transparent;

    table.source.selectionNotifier.addListener(toggleSelect);
  }

  void toggleSelect() {
    isSelected = table.source.selectionNotifier.value;
    if (isSelected) {
      key.currentState?.open();
    } else {
      key.currentState?.close();
    }
    setState(() {});
  }

  @override
  void dispose() {
    table.source.selectionNotifier.removeListener(toggleSelect);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = DataTablePlusThemeData.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (d) {
            isHovered = true;
            color = table.rowHoverColor?.call(widget.index, widget.item) ??
                table.rowColor?.call(widget.index, widget.item) ??
                Colors.transparent;

            setState(() {});
            Future.delayed(
              theme.showCheckboxDelay!,
              () {
                if (isHovered) key.currentState?.open();
              },
            );
          },
          onExit: (d) {
            isHovered = false;
            color = table.rowColor?.call(widget.index, widget.item) ??
                Colors.transparent;

            setState(() {});
            if (isSelected) return;
            key.currentState?.close();
          },
          child: Slidable(
            enabled: theme.showCheckboxSlidable!,
            key: key,
            actionExtentRatio: 0.05,
            actionPane: const SlidableScrollActionPane(),
            actions: [
              SlideAction(
                color: color,
                child: Checkbox(
                  activeColor: theme.checkboxColor,
                  value: isSelected,
                  onChanged: (value) {
                    isSelected = value ?? false;
                    setState(() {});
                    table.onSelectionChanged?.call(
                      widget.index,
                      widget.item,
                      isSelected,
                    );
                  },
                ),
              ),
            ],
            child: Container(
              height: theme.rowHeight,
              color: color,
              child: Row(
                children: widget.cells,
              ),
            ),
          ),
        );
      },
    );
  }
}
