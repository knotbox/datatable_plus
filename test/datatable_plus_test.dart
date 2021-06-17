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

      addTearDown(source.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DataTablePlus<Map<String, dynamic>>(
              source: source,
              onRowPressed: (_, __) => log.add('row-pressed'),
              empty: () => const SizedBox(),
              loading: () => const SizedBox(),
              error: (err) => const SizedBox(),
              header: const SizedBox(),
              columns: [
                TableColumn(
                  label: Text('Column 1'),
                  cellBuilder: (_) => Container(),
                  canSort: true,
                ),
                TableColumn(
                  label: Text('Column 2'),
                  cellBuilder: (_) => Container(),
                  canSort: true,
                ),
                TableColumn(
                  label: Text('Column 3'),
                  cellBuilder: (_) => Container(),
                  canSort: true,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find
            .byWidgetPredicate((widget) =>
                widget is GestureDetector &&
                widget.child is TableRow<Map<String, dynamic>>)
            .first,
      );

      expect(log, <String>['row-pressed']);
      log.clear();

      // await tester.tap(
      //   find.byIcon(Icons.arrow_forward_ios),
      // );

      // await tester.pump();

      // expect(source.page, 1);
    },
  );
}
