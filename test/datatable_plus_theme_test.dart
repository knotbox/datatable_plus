import 'package:datatable_plus/datatable_plus.dart';
import 'package:datatable_plus/src/widgets/header.dart';
import 'package:datatable_plus/src/widgets/row.dart';
import 'package:flutter/material.dart' hide TableRow;
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'datatable_plus_test_utils.dart';

void main() {
  test('DataTablePlusThemeData copyWith, ==, hashCode basics', () {
    expect(
      DataTablePlusThemeData(),
      DataTablePlusThemeData(),
    );
    expect(
      DataTablePlusThemeData().hashCode,
      DataTablePlusThemeData().hashCode,
    );
  });

  test('DataTablePlusThemeData defaults', () {
    final DataTablePlusThemeData themeData = DataTablePlusThemeData.defaults;
    expect(themeData.footerColor, null);
    expect(themeData.footerIconTheme, null);
    expect(themeData.footerTextStyle, null);
    expect(themeData.headerRowColor, null);
    expect(themeData.headerRowTextStyle, null);
    expect(themeData.rowHeight, kMinInteractiveDimension);
    expect(themeData.rowsPerPageLabel, "");

    DataTablePlusTheme theme = DataTablePlusTheme(
      data: DataTablePlusThemeData.defaults,
      child: SizedBox(),
    );
    expect(theme.data.footerColor, null);
    expect(theme.data.footerIconTheme, null);
    expect(theme.data.footerTextStyle, null);
    expect(theme.data.headerRowColor, null);
    expect(theme.data.headerRowTextStyle, null);
    expect(theme.data.rowHeight, kMinInteractiveDimension);
    expect(theme.data.rowsPerPageLabel, "");
  });

  testWidgets(
    'DataTablePlus is themeable',
    (WidgetTester tester) async {
      final theme = DataTablePlusThemeData(
        rowsPerPageLabel: 'Rows Per Page',
        rowHeight: 60,
        headerRowColor: Colors.red,
        headerRowTextStyle: TextStyle(color: Colors.blue),
        footerColor: Colors.red,
        footerTextStyle: TextStyle(color: Colors.blue),
        footerIconTheme: IconThemeData(color: Colors.purple),
      );

      final source = TestSource();

      addTearDown(source.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DataTablePlus<Map<String, dynamic>>(
              source: source,
              theme: theme,
              onRowPressed: (_, __) => null,
              empty: () => const SizedBox(),
              loading: () => const SizedBox(),
              error: (err) => const SizedBox(),
              header: const SizedBox(),
              columns: [
                TableColumn(
                  label: Text('Column'),
                  cellBuilder: (_) => Container(),
                ),
                TableColumn(
                  label: Text('Column'),
                  cellBuilder: (_) => Container(),
                ),
                TableColumn(
                  label: Text('Column'),
                  cellBuilder: (_) => Container(),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      final row = find.byWidgetPredicate(
        (widget) => widget is TableRow<Map<String, dynamic>>,
      );

      final header = find.byWidgetPredicate(
        (widget) => widget is TableHeader<Map<String, dynamic>>,
      );

      final headerDecoratedBox = tester.widget<DecoratedBox>(
        find.descendant(
          of: header,
          matching: find.byType(DecoratedBox),
        ),
      );

      final footerContainer = find.byWidgetPredicate((widget) =>
          widget is Container &&
          (widget.decoration as BoxDecoration).color == theme.footerColor);

      expect(tester.getSize(row.first).height, theme.rowHeight);

      expect(find.text('Rows Per Page'), findsOneWidget);

      expect(
        (headerDecoratedBox.decoration as BoxDecoration).color,
        theme.headerRowColor,
      );

      expect(
        footerContainer,
        findsOneWidget,
      );
    },
  );
}
