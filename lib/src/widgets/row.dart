import 'dart:async';

import 'package:datatable_plus/src/models/controller_action.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:collection/collection.dart';

import '../../datatable_plus.dart';
import '../data_table_plus.dart';
import '../data_table_plus_theme.dart';

class TableRow<T> extends StatefulWidget {
  final int index;
  final T item;
  final List<Widget> cells;
  final List<double> sizes;

  const TableRow({
    Key? key,
    required this.index,
    required this.cells,
    required this.item,
    required this.sizes,
  }) : super(key: key);

  @override
  _TableRowState<T> createState() => _TableRowState<T>();
}

class _TableRowState<T> extends State<TableRow<T>>
    with TickerProviderStateMixin {
  late Color color;
  late bool isSelected;
  late DataTablePlus<T> table;
  late AnimationController controller;
  late Animation<double> animation;
  var _init = true;
  StreamSubscription? sub;
  late ExpandableController expandableController;

  DataTablePlusController<T> get tableController =>
      table.controller as DataTablePlusController<T>;

  void handleEvent(Action event) {
    switch (event.type) {
      case ActionType.openExpandable:
        onToggleExpanded(false);
        expandableController.value = true;
        break;
      case ActionType.closeExpandable:
        onToggleExpanded(true);
        expandableController.value = false;
        break;
      case ActionType.openSlidable:
        controller.forward();
        break;
      case ActionType.closeSlidable:
        controller.reverse();
        break;
      case ActionType.toggleExpandable:
        onToggleExpanded(expandableController.value);
        expandableController.value = !expandableController.value;
        break;
      case ActionType.select:
        onToggleSelection(true);
        break;
      case ActionType.unselect:
        onToggleSelection(false);
        break;
    }
  }

  void onToggleExpanded(bool expanded) {
    final key = tableController.primaryKey(widget.item);
    if (expanded) {
      tableController.retracted.add(key);
      tableController.expanded.value = [
        ...tableController.expanded.value,
      ]..remove(key);
    } else {
      tableController.retracted.remove(key);
      tableController.expanded.value = [...tableController.expanded.value, key];
    }
  }

  void onToggleSelection(bool selected) {
    isSelected = selected;
    if (isSelected) {
      tableController.selected[tableController.primaryKey(widget.item!)] =
          widget.item!;
    } else {
      tableController.selected.remove(
        tableController.primaryKey(widget.item!),
      );
    }
    setState(() {});
    table.onSelectionChanged?.call(
      widget.index,
      widget.item,
      isSelected,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    table = DataTablePlus.of<T>(context)!;

    final theme = DataTablePlusThemeData.of(context);
    color =
        table.rowColor?.call(widget.index, widget.item) ?? Colors.transparent;

    if (_init) {
      expandableController = ExpandableController(
        initialExpanded: tableController.isFullyExpanded.value ||
            tableController.expanded.value.contains(
              tableController.primaryKey(widget.item),
            ),
      );
      isSelected = tableController.selected.containsKey(
        tableController.primaryKey(widget.item!),
      );

      sub = table.controller.events
          .where((event) => event.index == widget.index || event.index == null)
          .listen(handleEvent);

      controller = AnimationController(
        vsync: this,
        value: table.controller.selected.isNotEmpty ? 1 : 0,
        duration: theme.checkboxSlidableTheme!.duration!,
      );
      animation = Tween(
        begin: theme.checkboxSlidableTheme!.indicatorWidth,
        end: 50.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: theme.checkboxSlidableTheme!.curve!,
        ),
      );
    }
  }

  @override
  void dispose() {
    expandableController.dispose();
    sub?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = DataTablePlusThemeData.of(context);
    final slidableTheme = theme.checkboxSlidableTheme;
    bool canPressRow = widget.item == null ? false : table.onRowPressed != null;

    Widget row = MouseRegion(
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

        if (!isSelected && table.controller.selected.isEmpty) {
          controller.reverse();
        }

        setState(() {});
      },
      onHover: (d) {
        if (d.localPosition.dx < slidableTheme!.indicatorWidth!) {
          if (controller.isAnimating) return;
          controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) => Row(
          children: [
            Container(
              color: table.checkboxBackgroundColor?.call(
                widget.index,
                widget.item,
              ),
              width: animation.value,
              height: theme.rowHeight,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                child: animation.value > 25
                    ? Checkbox(
                        activeColor: slidableTheme!.activeColor,
                        checkColor: slidableTheme.checkColor,
                        value: isSelected,
                        onChanged: (value) {
                          onToggleSelection(value ?? false);
                        },
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Expanded(
              child: Container(
                height: theme.rowHeight,
                color: color,
                child: Row(
                  children: widget.cells.mapIndexed(
                    (index, e) {
                      return SizedBox(
                        width: index == table.shrinkableColumnIndex
                            ? widget.sizes[index] - animation.value
                            : widget.sizes[index],
                        child: e,
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (canPressRow) {
      row = GestureDetector(
        onTap: () => table.onRowPressed!(widget.index, widget.item),
        child: row,
      );
    }

    if (table.source.rowsExpandable) {
      row = ExpandablePanel(
        controller: expandableController,
        collapsed: row,
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            row,
            table.expandedRow!(widget.index, widget.item),
          ],
        ),
      );
    }

    return row;
  }
}
