import 'package:collection/collection.dart';
import 'package:datatable_plus/src/data_table_plus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:datatable_plus/datatable_plus.dart';

import 'data_table_plus_source.dart';
import 'data_table_plus_theme.dart';
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

  ///Source of this table, contains the underlying data used in rows
  final DataTablePlusSource<T> source;

  ///Color used in specific row
  final Color Function(int, T)? rowColor;

  ///Color used in specific row when hovered
  final Color Function(int, T)? rowHoverColor;

  ///Textstyle used for this row
  final TextStyle? Function(int, T)? rowTextStyle;

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
  final void Function(int, T)? onRowPressed;

  ///Widget shown when the row is expanded
  final Widget Function(int, T)? expandedRow;

  ///The minimum table width before making rows horizontally scrollable
  final double minWidth;

  ///Theme of this table
  final DataTablePlusThemeData? theme;

  ///Color used for the background and checkbox slidable indicator for a row
  final Color Function(int, T)? checkboxBackgroundColor;

  ///Table controller which is used to expand/retract expandables and slidables.
  final DataTablePlusController controller;

  ///Column to shrink when opening the checkbox slidable
  ///
  ///Defaults to the first column if not specified
  final int shrinkableColumnIndex;

  ///Color of the tick mark in the checkboxes
  final Color? Function(int, T)? checkColor;

  final List<Object> selected;

  final List<Object> expanded;

  final Object Function(T) keyOf;

  const DataTablePlus({
    Key? key,
    required this.keyOf,
    required this.controller,
    required this.loading,
    required this.error,
    required this.header,
    required this.columns,
    required this.source,
    required this.empty,
    required this.onRowPressed,
    this.shrinkableColumnIndex = 0,
    this.checkColor,
    this.rowColor,
    this.selected = const [],
    this.expanded = const [],
    this.rowTextStyle,
    this.rowHoverColor,
    this.minWidth = 600,
    this.availableRowsPerPage = const [10, 20, 50, 100],
    this.showRowPerPageSelection = true,
    this.onPageChanged,
    this.footerWidgets = const [],
    this.expandedRow,
    this.theme,
    this.checkboxBackgroundColor,
  }) : super(key: key);

  static DataTablePlus<T>? of<T>(BuildContext context) =>
      context.findAncestorWidgetOfExactType<DataTablePlus<T>>();

  @override
  _DataTablePlusState<T> createState() => _DataTablePlusState<T>();
}

class _DataTablePlusState<T> extends State<DataTablePlus<T>> {
  @override
  void initState() {
    super.initState();

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
      data: DataTablePlusThemeData.merge(
        widget.theme,
        DataTablePlusThemeData.defaults,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.minWidth > widget.minWidth
              ? constraints.minWidth
              : widget.minWidth;

          double flexSum = widget.columns
              .map((e) => e.size)
              .whereType<FlexTableColumn>()
              .fold<double>(0, (prev, curr) => prev += curr.flex);

          double fixedSum = widget.columns
              .map((e) => e.size)
              .whereType<FixedTableColumn>()
              .fold<double>(0, (prev, curr) => prev += curr.size);

          final cellSizes = List.filled(widget.columns.length, 0.0);

          widget.columns.map((e) => e.size).forEachIndexed(
            (index, columnSize) {
              cellSizes[index] = columnSize.when(
                flex: (flex) => (width - fixedSum) / flexSum * flex,
                fixed: (size) => size,
              );
            },
          );

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: width,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  widget.header,
                  TableHeader(
                    cellSizes: cellSizes,
                    columns: widget.columns,
                    source: widget.source,
                  ),
                  widget.source.value.when(
                    empty: widget.empty,
                    data: (data) => TableBody<T>(
                      data: data,
                      rowsPerPage: widget.source.rowsPerPage,
                      cellSizes: cellSizes,
                      page: widget.source.page,
                      columns: widget.columns,
                      textStyle: widget.rowTextStyle,
                    ),
                    loading: widget.loading,
                    error: widget.error,
                  ),
                  TableFooter(
                    showRowPerPageSelection: widget.showRowPerPageSelection,
                    source: widget.source,
                    availableRowsPerPage: widget.availableRowsPerPage,
                    footerWidgets: widget.footerWidgets,
                    onPageChanged: widget.onPageChanged,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
