import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

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
      isHovered = true;
    } else {
      isHovered = false;
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
    final slidableTheme = theme.checkboxSlidableTheme;
    bool canPressRow = widget.item == null ? false : table.onRowPressed != null;

    Widget row = LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (d) {
            color = table.rowHoverColor?.call(widget.index, widget.item) ??
                table.rowColor?.call(widget.index, widget.item) ??
                Colors.transparent;
          },
          onExit: (d) {
            color = table.rowColor?.call(widget.index, widget.item) ??
                Colors.transparent;

            if (!isSelected) {
              isHovered = false;
            }

            setState(() {});
          },
          onHover: (d) {
            if (d.localPosition.dx < slidableTheme!.indicatorWidth!) {
              if (isHovered) return;
              isHovered = true;
              setState(() {});
            }
          },
          child: Row(
            children: [
              AnimatedContainer(
                duration: slidableTheme!.duration!,
                curve: slidableTheme.curve!,
                color: slidableTheme.backgroundColor,
                width: isHovered ? 50 : slidableTheme.indicatorWidth,
                height: theme.rowHeight,
                child: isHovered
                    ? Checkbox(
                        activeColor: slidableTheme.activeColor,
                        checkColor: slidableTheme.checkColor,
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
                      )
                    : null,
              ),
              Expanded(
                child: Container(
                  height: theme.rowHeight,
                  color: color,
                  child: Row(
                    children: widget.cells,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (canPressRow) {
      row = GestureDetector(
        onTap: () => table.onRowPressed!(widget.index, widget.item),
        child: row,
      );
    }

    if (table.source.rowsExpandable) {
      final expandableKey = table.expandableKey!(widget.index, widget.item);

      row = SizedBox(
        width: widget.flex ? null : table.scrollableTableWidth,
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
              table.expandedRow!(widget.index, widget.item),
            ],
          ),
        ),
      );
    }

    return row;
  }
}
