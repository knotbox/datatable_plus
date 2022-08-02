import 'package:flutter/material.dart';

import '../../datatable_plus.dart';

class PageControls<T> extends StatelessWidget {
  const PageControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final table = DataTablePlus.of<T>(context)!;
    final source = table.source;
    final theme = DataTablePlusThemeData.of(context);
    var totalPage = (source.rowCount / source.rowsPerPage).ceil();
    if (totalPage < 1) {
      totalPage = 1;
    }

    return Row(
      children: [
        if (totalPage >= 3)
          IconButton(
            splashRadius: 20,
            onPressed: source.page == 0
                ? null
                : () {
                    source.loadFirstPage();
                    table.onPageChanged?.call(source.page);
                  },
            icon: const Icon(
              Icons.first_page,
              size: 16,
            ),
          ),
        IconButton(
          splashRadius: 20,
          onPressed: source.page == 0
              ? null
              : () {
                  source.loadPreviousPage();
                  table.onPageChanged?.call(source.page);
                },
          icon: const Icon(
            Icons.chevron_left,
            size: 16,
          ),
        ),
        Text(
          table.pageLabel?.call(
                source.page,
                source.rowsPerPage,
                source.rowCount,
              ) ??
              '${source.page + 1} / $totalPage',
          style: theme.footerTextStyle,
        ),
        IconButton(
          splashRadius: 20,
          onPressed: source.isLastPage
              ? null
              : () {
                  source.loadNextPage();
                  table.onPageChanged?.call(source.page);
                },
          icon: const Icon(
            Icons.chevron_right,
            size: 16,
          ),
        ),
        if (totalPage >= 3)
          IconButton(
            splashRadius: 20,
            onPressed: source.isLastPage
                ? null
                : () {
                    source.loadLastPage();
                    table.onPageChanged?.call(source.page);
                  },
            icon: const Icon(
              Icons.last_page,
              size: 16,
            ),
          ),
      ],
    );
  }
}
