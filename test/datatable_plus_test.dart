import 'package:datatable_plus/src/widgets/header.dart';
import 'package:datatable_plus/src/widgets/row.dart';

import 'package:flutter/material.dart' hide TableRow;
import 'package:flutter_test/flutter_test.dart';

import 'package:datatable_plus/datatable_plus.dart';

import 'datatable_plus_test_utils.dart';

void main() {
  testWidgets(
    'DataTablePlus - Control Test',
    (tester) async {
      final List<String> log = <String>[];
      final source = TestSource();
      final controller = DataTablePlusController();

      addTearDown(source.dispose);
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DataTablePlus<Map<String, dynamic>>(
              keyOf: (item) => item['test'],
              shrinkableColumnIndex: 1,
              controller: controller,
              source: source,
              onRowPressed: (_, __) => log.add('row-pressed'),
              empty: () => const SizedBox(),
              loading: () => const SizedBox(),
              error: (err) => const SizedBox(),
              header: const SizedBox(),
              columns: [
                TableColumn(
                  label: Text('Column 1'),
                  cellBuilder: (_, __) => Container(),
                  canSort: true,
                ),
                TableColumn(
                  label: Text('Column 2'),
                  cellBuilder: (_, __) => Container(),
                  canSort: true,
                ),
                TableColumn(
                  label: Text('Column 3'),
                  cellBuilder: (_, __) => Container(),
                  canSort: true,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.tap(
        find.byIcon(Icons.arrow_forward_ios),
      );

      expect(source.page, 1);

      await tester.pump();

      await tester.tap(
        find
            .byWidgetPredicate((widget) =>
                widget is GestureDetector &&
                widget.child is TableRow<Map<String, dynamic>>)
            .first,
      );

      expect(log, <String>['row-pressed']);

      log.clear();

      final firstHeader = find.descendant(
        of: find.byWidgetPredicate((widget) => widget is TableHeader),
        matching: find.byType(InkWell).first,
      );

      await tester.tap(firstHeader);

      expect(source.sortColumnIndex, 0);
      expect(source.sortAscending, true);

      await tester.pump();

      expect(find.byIcon(Icons.keyboard_arrow_up), findsOneWidget);

      await tester.tap(firstHeader);

      expect(source.sortColumnIndex, 0);
      expect(source.sortAscending, false);

      await tester.pump();

      expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    },
  );
}
