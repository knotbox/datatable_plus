import 'package:flutter/material.dart';

import '../data_table_plus_source.dart';
import '../data_table_plus_theme.dart';

class TableFooter extends StatelessWidget {
  final DataTablePlusSource source;
  final bool showRowPerPageSelection;
  final List<Widget> footerWidgets;
  final List<int> availableRowsPerPage;
  final void Function(int)? onPageChanged;

  const TableFooter({
    Key? key,
    required this.source,
    required this.showRowPerPageSelection,
    required this.footerWidgets,
    this.onPageChanged,
    required this.availableRowsPerPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DataTablePlusThemeData.of(context);
    var totalPage = (source.rowCount / source.rowsPerPage).ceil();
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
                      ...footerWidgets,
                      const VerticalDivider(indent: 10, endIndent: 10),
                      if (showRowPerPageSelection)
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
                                    value: source.rowsPerPage,
                                    items: availableRowsPerPage
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
                                      source.onRowsPerPageChanged(
                                        rowsPerPage,
                                        source.page,
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
                        onPressed: source.page == 0
                            ? null
                            : () {
                                source.loadPreviousPage();
                                onPageChanged?.call(source.page);
                              },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                        ),
                      ),
                      Text(
                        '${source.page + 1} / $totalPage',
                        style: theme.footerTextStyle,
                      ),
                      IconButton(
                        onPressed: source.isLastPage
                            ? null
                            : () {
                                source.loadNextPage();
                                onPageChanged?.call(source.page);
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
