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
  @override
  Widget build(BuildContext context) {
    final table = DataTablePlus.of<T>(context)!;

    Widget scrollView(bool flex) => SingleChildScrollView(
          child: Column(
            children: List.generate(
              table.addEmptyRows
                  ? table.source.rowsPerPage
                  : widget.data.length,
              (index) {
                final item =
                    index >= widget.data.length ? null : widget.data[index];

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
                          style: table.rowTextStyle?.call(index, item) ??
                              DefaultTextStyle.of(context).style,
                          child: column.cellBuilder(item!),
                        ),
                      );
                    }

                    return flex
                        ? column.size.when(
                            flex: (flex) => Expanded(
                              flex: flex,
                              child: child,
                            ),
                            fixed: (size) => SizedBox(
                              width: size,
                              child: child,
                            ),
                            max: (size) => ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: size),
                              child: child,
                            ),
                            min: (size) => ConstrainedBox(
                              constraints: BoxConstraints(minWidth: size),
                              child: child,
                            ),
                          )
                        : column.size.when(
                            flex: (flex) => SizedBox(
                              width: table.scrollableCellWidth,
                              child: child,
                            ),
                            fixed: (size) => SizedBox(
                              width: size,
                              child: child,
                            ),
                            max: (size) => ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: size),
                              child: child,
                            ),
                            min: (size) => ConstrainedBox(
                              constraints: BoxConstraints(minWidth: size),
                              child: child,
                            ),
                          );
                  },
                );

                bool canPressRow =
                    item == null ? false : table.onRowPressed != null;

                Widget row = TableRow<T>(
                  cells: List<Widget>.from(cells),
                  index: index,
                  item: item,
                );

                if (canPressRow) {
                  row = MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => table.onRowPressed!(index, item),
                      child: row,
                    ),
                  );
                }

                if (table.source.rowsExpandable) {
                  final expandableKey = table.expandableKey!(index, item);

                  row = SizedBox(
                    width: flex ? null : table.scrollableTableWidth,
                    child: ExpandablePanel(
                      controller:
                          table.source.expandableControllers.putIfAbsent(
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

                return row;
              },
            ),
          ),
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth < table.scrollableTableWidth) {
          return SingleChildScrollView(
            key: ValueKey(constraints.minWidth),
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            child: scrollView(false),
          );
        }
        return scrollView(true);
      },
    );
  }
}
