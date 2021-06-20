import 'package:datatable_plus/src/data_table_plus_theme.dart';
import 'package:flutter/material.dart';

import '../data_table_plus.dart';

class TableHeader<T> extends StatelessWidget {
  const TableHeader({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final table = DataTablePlus.of<T>(context)!;
    final theme = DataTablePlusThemeData.of(context);
    return DefaultTextStyle(
      style: theme.headerRowTextStyle ?? DefaultTextStyle.of(context).style,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isExpanded = constraints.minWidth > table.scrollableTableWidth;
          final headers = List.generate(
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

              if (isExpanded) {
                return column.size.when(
                  flex: (flex) => isExpanded
                      ? Expanded(
                          flex: flex,
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
              }
            },
          );

          return DecoratedBox(
            decoration: BoxDecoration(
              color: theme.headerRowColor ?? Colors.transparent,
            ),
            child: isExpanded
                ? Row(
                    children: List<Widget>.from(headers),
                  )
                : SizedBox(
                    height: theme.rowHeight,
                    child: ListView(
                      controller: scrollController,
                      shrinkWrap: true,
                      children: List<Widget>.from(headers),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
