import 'package:flutter/material.dart';

import '../data_table_plus_source.dart';
import '../data_table_plus_theme.dart';
import 'page_controls.dart';

class TableFooter<T> extends StatelessWidget {
  final DataTablePlusSource source;
  final bool showRowPerPageSelection;
  final List<Widget> footerWidgets;
  final List<int> availableRowsPerPage;
  final void Function(int)? onPageChanged;
  final String Function(int page, int rowsPerPage, int rowCount)? pageLabel;

  const TableFooter({
    Key? key,
    required this.source,
    required this.showRowPerPageSelection,
    required this.footerWidgets,
    this.onPageChanged,
    required this.availableRowsPerPage,
    this.pageLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DataTablePlusThemeData.of(context);

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
                      PageControls<T>(),
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
