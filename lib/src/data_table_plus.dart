import 'package:datatable_plus/src/data_table_plus_theme.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'data_table_plus_source.dart';
import 'models/table_column.dart';
import 'widgets/body.dart';
import 'widgets/footer.dart';
import 'widgets/header.dart';

class DataTablePlus<T> extends StatefulWidget {
  ///Widget shown during loading of data
  final Widget Function() loading;

  ///Widget shown if an error is thrown during the loading of data
  final Widget Function(Object err) error;

  ///Widget shown if collection is empty
  final Widget Function() empty;

  ///Widget at the very top of the table
  final Widget header;

  ///Source
  final DataTablePlusSource<T> source;

  ///Color used in specific row
  final Color Function(int, T?)? rowColor;

  ///Textstyle used for this row
  final TextStyle? Function(int, T?)? rowTextStyle;

  ///List of Table Column
  final List<TableColumn<T>> columns;

  ///Available rows per page displayed in a dropdown
  final List<int> availableRowsPerPage;

  ///Shows a dropdown button to select rows per page from [availableRowsPerPage]
  final bool showRowPerPageSelection;

  final void Function(int)? onPageChanged;

  ///Widgets displayed in a [Row] in the footer of the table
  final List<Widget> footerWidgets;

  ///If not null, triggered when a row is pressed
  final void Function(int, T?)? onRowPressed;

  ///Widget shown when the row is expanded
  final Widget Function(int, T?)? expandedRow;

  ///Add empty rows to match rowsPerPage if not enough items loaded
  final bool addEmptyRows;

  ///Key used to find the expandable controller belonging to the object [T] at index
  final Object Function(int, T?)? expandableKey;

  ///The minimum table width before making rows horizontally scrollable
  final double scrollableTableWidth;

  ///The default cell with of normally expanded cell when the table is made scrollable
  final double scrollableCellWidth;

  ///Theme of this table
  final DataTablePlusThemeData? theme;

  const DataTablePlus({
    Key? key,
    required this.loading,
    required this.error,
    required this.header,
    required this.columns,
    required this.source,
    required this.empty,
    required this.onRowPressed,
    this.rowColor,
    this.rowTextStyle,
    this.scrollableTableWidth = 600,
    this.scrollableCellWidth = 200,
    this.availableRowsPerPage = const [10, 20, 50, 100],
    this.showRowPerPageSelection = true,
    this.onPageChanged,
    this.addEmptyRows = false,
    this.footerWidgets = const [],
    this.expandedRow,
    this.expandableKey,
    this.theme,
  }) : super(key: key);

  static DataTablePlus<T>? of<T>(BuildContext context) =>
      context.findAncestorWidgetOfExactType<DataTablePlus<T>>();

  @override
  _DataTablePlusState<T> createState() => _DataTablePlusState<T>();
}

class _DataTablePlusState<T> extends State<DataTablePlus<T>> {
  final scrollGroup = LinkedScrollControllerGroup();
  late ScrollController headerController;
  late ScrollController bodyController;

  @override
  void initState() {
    super.initState();
    bodyController = scrollGroup.addAndGet();
    headerController = scrollGroup.addAndGet();
    widget.source.addListener(_update);
    //Loads the page
    Future.microtask(
      () => widget.source.onRowsPerPageChanged(
        widget.source.rowsPerPage,
        widget.source.page,
      ),
    );
  }

  void _update() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.source.removeListener(_update);
    bodyController.dispose();
    headerController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DataTablePlus<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source != widget.source) {
      oldWidget.source.removeListener(_update);
      widget.source.addListener(_update);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataTablePlusTheme(
      data: widget.theme ?? DataTablePlusThemeData.defaults,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          widget.header,
          TableHeader<T>(
            scrollController: headerController,
          ),
          widget.source.value.when(
            empty: widget.empty,
            data: (data) => TableBody<T>(
              data: data,
              scrollController: bodyController,
            ),
            loading: widget.loading,
            error: widget.error,
          ),
          TableFooter<T>()
        ],
      ),
    );
  }
}
