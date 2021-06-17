import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/page_request.dart';
import 'models/table_value.dart';

abstract class DataTablePlusSource<T> extends ChangeNotifier {
  TableValue<T> value = const TableValue.loading();

  ///Current page
  int page = 0;

  ///Total rows available in the collection
  int get rowCount;

  ///Make rows expandable
  bool get rowsExpandable;

  ///Index of the column by which the table is sorted
  int? sortColumnIndex;

  ///If the table is sorted in ascendant order
  bool? sortAscending;

  ///Current rows per page
  int rowsPerPage = 10;

  ///True if all rows in the table are expanded
  bool isFullyExpanded = false;

  ///Map containing a all expandable controllers loaded so far.
  ///When building rows, lazily adds a controller to this map.
  ///[Object] is used as a key, use it to recover the state of the controller when rebuilding the row.
  Map<Object, ExpandableController> expandableControllers = {};

  ///Tracks whether this change notifier was disposed or not
  @protected
  bool mounted = true;

  ///Expands all rows
  void expandAll() {
    isFullyExpanded = true;
    expandableControllers.values.forEach((e) => e.value = true);
    notifyListeners();
  }

  ///Retracts all rows
  void retractAll() {
    isFullyExpanded = false;
    expandableControllers.values.forEach((e) => e.value = false);
    notifyListeners();
  }

  ///Toggles the expansion of one specific row based on the [Object] key
  void toggleExpansion(Object key) {
    expandableControllers[key]?.toggle();
  }

  @mustCallSuper
  void onRowsPerPageChanged(int? rowsPerPage, int page) {
    this.rowsPerPage = rowsPerPage ?? 10;
    _loadPage(page);
  }

  @nonVirtual
  Future<void> loadPreviousPage() async {
    page -= 1;
    await _loadPage(page);
  }

  @nonVirtual
  Future<void> loadNextPage() async {
    page += 1;
    await _loadPage(page);
  }

  bool get isLastPage => page == (rowCount / rowsPerPage).floor();

  Future<void> sort(
    int sortColumnIndex,
    bool sortAscending,
  ) async {
    this.sortAscending = sortAscending;
    this.sortColumnIndex = sortColumnIndex;

    await _loadPage(
      page,
      sortAscending: sortAscending,
      sortColumnIndex: sortColumnIndex,
    );
  }

  @nonVirtual
  Future<void> _loadPage(
    int? page, {
    int? sortColumnIndex,
    bool? sortAscending,
  }) async {
    value = TableLoading();
    notifyListeners();

    try {
      final result = await fetchPage(
        PageRequest(
          sortColumnIndex: this.sortColumnIndex,
          offset: rowsPerPage * (page ?? this.page),
          sortAscending: this.sortAscending,
          pageSize: rowsPerPage,
        ),
      );

      if (result.isEmpty) {
        value = TableEmpty();
      } else {
        value = TableData(result);
      }
    } catch (err) {
      print(err);
      value = TableError(err);
    } finally {
      if (mounted) notifyListeners();
    }
  }

  ///Shows the loading view in the table
  @nonVirtual
  void showLoading() {
    value = TableLoading();
    notifyListeners();
  }

  ///Shows the error view in the table
  @nonVirtual
  void showError(Object err) {
    value = TableError(err);
    notifyListeners();
  }

  ///updates the currently shown data without going through a fetch process
  void updateValue(List<T> items) {
    if (items.isEmpty) {
      value = TableEmpty();
    } else {
      value = TableData(items);
    }
    if (mounted) notifyListeners();
  }

  ///Called when new page is requested based on current offset, current page
  ///and sorting column/order.
  ///
  ///Should return a [List] of items of type [T].
  ///
  ///Loading view will automatically be displayed while this function runs.
  ///
  ///If functions throws error, automatically catches it and shows error widget.
  Future<List<T>> fetchPage(PageRequest request);

  @protected
  void disposeExpandableControllers() {
    expandableControllers.values.map(
      (e) => e.dispose(),
    );
  }

  @override
  void dispose() {
    disposeExpandableControllers();
    mounted = false;
    super.dispose();
  }
}
