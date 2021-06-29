import 'package:flutter/material.dart';

class DataTablePlusThemeData {
  static final DataTablePlusThemeData defaults = DataTablePlusThemeData();

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
  final String rowsPerPageLabel;

  ///Style used for text in the footer
  final TextStyle? footerTextStyle;

  ///Duration of the color transition when a row is hovered
  final Duration rowHoverTransitionDuration;

  ///Height of each row
  ///
  ///Defaults to [kMinInteractiveDimension]
  final double rowHeight;

  const DataTablePlusThemeData({
    this.rowsPerPageLabel = "",
    this.rowHeight = kMinInteractiveDimension,
    this.headerRowColor,
    this.headerRowTextStyle,
    this.footerTextStyle,
    this.footerColor,
    this.rowHoverTransitionDuration = const Duration(milliseconds: 150),
    this.footerIconTheme,
  });

  static DataTablePlusThemeData merge(
      DataTablePlusThemeData? theme, DataTablePlusThemeData? defaults) {
    if (defaults == null || defaults.isEmpty()) {
      return theme ?? empty;
    } else if (theme == null || theme.isEmpty()) {
      return defaults;
    } else if (theme.isFull()) {
      return theme;
    } else {
      return DataTablePlusThemeData(
        rowHeight: theme.rowHeight,
        footerColor: theme.footerColor ?? defaults.footerColor,
        footerTextStyle: theme.footerTextStyle ?? defaults.footerTextStyle,
        headerRowColor: theme.headerRowColor ?? defaults.headerRowColor,
        headerRowTextStyle:
            theme.headerRowTextStyle ?? defaults.headerRowTextStyle,
        rowsPerPageLabel: theme.rowsPerPageLabel,
        footerIconTheme: theme.footerIconTheme ?? defaults.footerIconTheme,
      );
    }
  }

  DataTablePlusThemeData? nullIfEmpty() {
    return isEmpty() ? null : this;
  }

  bool isEmpty() {
    return this == empty;
  }

  bool isFull() {
    return this.footerColor != null &&
        this.footerTextStyle != null &&
        this.headerRowColor != null &&
        this.headerRowTextStyle != null;
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
          this.footerIconTheme == o.footerIconTheme;
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

  static DataTablePlusThemeData withDefaults(
      DataTablePlusThemeData? theme, BuildContext context,
      {bool rebuildOnChange = true}) {
    if (theme != null && theme.isFull()) {
      return theme;
    } else {
      return merge(
          merge(theme, of(context, listen: rebuildOnChange)), defaults);
    }
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
