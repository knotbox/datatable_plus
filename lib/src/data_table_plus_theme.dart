import 'package:datatable_plus/src/checkbox_slidable_theme.dart';
import 'package:flutter/material.dart';

class DataTablePlusThemeData {
  static final DataTablePlusThemeData defaults = DataTablePlusThemeData(
    showCheckboxSlidable: false,
    rowHeight: kMinInteractiveDimension,
    rowsPerPageLabel: "",
    checkboxSlidableTheme: CheckboxSlidableTheme.defaults,
  );

  static final DataTablePlusThemeData empty = DataTablePlusThemeData();

  ///Color of the column headers
  final Color? headerRowColor;

  ///Style used for text in the first row containing column headers
  final TextStyle? headerRowTextStyle;

  ///Color of the footer row
  final Color? footerColor;

  ///Icon theme used in the footer
  final IconThemeData? footerIconTheme;

  ///Label apprearing before the rowsPerPage dropdown in the footer
  final String? rowsPerPageLabel;

  ///Style used for text in the footer
  final TextStyle? footerTextStyle;

  ///Height of each row
  ///
  ///Defaults to [kMinInteractiveDimension]
  final double? rowHeight;

  ///Whether to display a checkbox when row is hovered
  final bool? showCheckboxSlidable;

  final CheckboxSlidableTheme? checkboxSlidableTheme;

  const DataTablePlusThemeData({
    this.rowsPerPageLabel,
    this.rowHeight,
    this.headerRowColor,
    this.headerRowTextStyle,
    this.footerTextStyle,
    this.footerColor,
    this.footerIconTheme,
    this.checkboxSlidableTheme,
    this.showCheckboxSlidable,
  });

  static DataTablePlusThemeData merge(
      DataTablePlusThemeData? theme, DataTablePlusThemeData? defaults) {
    if (defaults == null || defaults.isEmpty()) {
      return theme ?? empty;
    } else if (theme == null || theme.isEmpty()) {
      return defaults;
    } else {
      return DataTablePlusThemeData(
        rowHeight: theme.rowHeight ?? defaults.rowHeight,
        footerColor: theme.footerColor ?? defaults.footerColor,
        footerTextStyle: theme.footerTextStyle ?? defaults.footerTextStyle,
        headerRowColor: theme.headerRowColor ?? defaults.headerRowColor,
        headerRowTextStyle:
            theme.headerRowTextStyle ?? defaults.headerRowTextStyle,
        rowsPerPageLabel: theme.rowsPerPageLabel ?? defaults.rowsPerPageLabel,
        footerIconTheme: theme.footerIconTheme ?? defaults.footerIconTheme,
        showCheckboxSlidable:
            theme.showCheckboxSlidable ?? defaults.showCheckboxSlidable,
        checkboxSlidableTheme:
            theme.checkboxSlidableTheme ?? defaults.checkboxSlidableTheme,
      );
    }
  }

  DataTablePlusThemeData? nullIfEmpty() {
    return isEmpty() ? null : this;
  }

  bool isEmpty() {
    return this == empty;
  }

  bool operator ==(dynamic o) {
    if (identical(this, o)) {
      return true;
    } else if (o is DataTablePlusThemeData) {
      return this.rowHeight == o.rowHeight &&
          this.footerColor == o.footerColor &&
          this.footerTextStyle == o.footerTextStyle &&
          this.headerRowColor == o.headerRowColor &&
          this.headerRowTextStyle == o.headerRowTextStyle &&
          this.rowsPerPageLabel == o.rowsPerPageLabel &&
          this.footerIconTheme == o.footerIconTheme &&
          this.checkboxSlidableTheme == o.checkboxSlidableTheme &&
          this.showCheckboxSlidable == o.showCheckboxSlidable;
    } else {
      return false;
    }
  }

  int get hashCode {
    return 0; // we don't care
  }

  static DataTablePlusThemeData of(BuildContext context, {bool listen = true}) {
    final notifier = listen
        ? context
            .dependOnInheritedWidgetOfExactType<_DataTablePlusThemeNotifier>()
        : context.findAncestorWidgetOfExactType<_DataTablePlusThemeNotifier>();
    return notifier?.themeData ?? defaults;
  }
}

class _DataTablePlusThemeNotifier extends InheritedWidget {
  final DataTablePlusThemeData? themeData;

  _DataTablePlusThemeNotifier({required this.themeData, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return !(oldWidget is _DataTablePlusThemeNotifier &&
        oldWidget.themeData == themeData);
  }
}

class DataTablePlusTheme extends StatelessWidget {
  final DataTablePlusThemeData data;
  final Widget child;

  DataTablePlusTheme({required this.data, required this.child});

  @override
  Widget build(BuildContext context) {
    _DataTablePlusThemeNotifier? n = context
        .dependOnInheritedWidgetOfExactType<_DataTablePlusThemeNotifier>();
    return _DataTablePlusThemeNotifier(
      themeData: DataTablePlusThemeData.merge(data, n?.themeData),
      child: this.child,
    );
  }
}
