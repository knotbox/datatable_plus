import 'package:datatable_plus/src/data_table_plus.dart';
import 'package:datatable_plus/src/data_table_plus_theme.dart';
import 'package:flutter/material.dart';

class TableFooter<T> extends StatelessWidget {
  const TableFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final table = DataTablePlus.of<T>(context)!;
    final theme = DataTablePlusThemeData.of(context);
    var totalPage = (table.source.rowCount / table.source.rowsPerPage).ceil();
    if (totalPage < 1) {
      totalPage = 1;
    }
    return SizedBox(
      height: theme.rowHeight,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: DefaultTextStyle(
              style:
                  theme.footerTextStyle ?? DefaultTextStyle.of(context).style,
              child: IconTheme(
                data: theme.footerIconTheme ?? Theme.of(context).iconTheme,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.footerColor ?? Colors.transparent,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...table.footerWidgets,
                      const VerticalDivider(indent: 10, endIndent: 10),
                      if (table.showRowPerPageSelection)
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    theme.rowsPerPageLabel!,
                                  ),
                                  const SizedBox(width: 10),
                                  DropdownButton<int>(
                                    underline: const SizedBox.shrink(),
                                    value: table.source.rowsPerPage,
                                    items: table.availableRowsPerPage
                                        .map(
                                          (e) => DropdownMenuItem(
                                            child: Text(
                                              '$e',
                                              style: theme.footerTextStyle,
                                            ),
                                            value: e,
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (rowsPerPage) {
                                      table.source.onRowsPerPageChanged(
                                        rowsPerPage,
                                        table.source.page,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const VerticalDivider(indent: 10, endIndent: 10),
                          ],
                        ),
                      IconButton(
                        onPressed: table.source.page == 0
                            ? null
                            : () {
                                table.source.loadPreviousPage();
                                table.onPageChanged?.call(table.source.page);
                              },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                        ),
                      ),
                      Text(
                        '${table.source.page + 1} / $totalPage',
                        style: theme.footerTextStyle,
                      ),
                      IconButton(
                        onPressed: table.source.isLastPage
                            ? null
                            : () {
                                table.source.loadNextPage();
                                table.onPageChanged?.call(table.source.page);
                              },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
