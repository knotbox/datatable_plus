import 'package:flutter/material.dart';

import 'package:datatable_plus/datatable_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Model {
  final String title;
  final String subtitle;

  Model({
    this.title = 'Title',
    this.subtitle = "Subtitle",
  });
}

class Source extends DataTablePlusSource<Model> {
  @override
  int get rowCount => items.length;

  final items = List.generate(
    1000,
    (index) => Model(
      title: 'Test',
      subtitle: '$index',
    ),
  );

  @override
  Future<List<Model>> fetchPage(request) {
    var list = items
        .getRange(
          request.offset,
          request.offset + request.pageSize,
        )
        .toList();

    if (request.sortColumnIndex == 1) {
      list.sort((a, b) => a.subtitle.compareTo(b.subtitle));
    }
    if (request.sortAscending ?? false) {
      list = list.reversed.toList();
    }
    return Future.value(list);
  }

  @override
  bool get rowsExpandable => true;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final source = Source();
  final controller = DataTablePlusController<Model>(
    (item) => item.subtitle,
  );

  @override
  void dispose() {
    controller.dispose();
    source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datatable Plus'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              if (controller.isFullyExpanded.value) {
                controller.closeExpandable();
              } else {
                controller.openExpandable();
              }
            },
            child: Text('Toggle select all'),
          ),
          Expanded(
            child: SizedBox.expand(
              child: SingleChildScrollView(
                child: DataTablePlus<Model>(
                  shrinkableColumnIndex: 1,
                  controller: controller,
                  checkboxBackgroundColor: (_, __) => Colors.red,
                  theme: DataTablePlusThemeData(
                    showCheckboxSlidable: true,
                    checkboxSlidableTheme: CheckboxSlidableTheme(
                      checkColor: Colors.red,
                      activeColor: Colors.green,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      indicatorWidth: 10,
                    ),
                  ),
                  rowColor: (_, __) => Colors.blue,
                  expandedRow: (index, item) => Container(height: 200),
                  rowHoverColor: (_, __) => Colors.blue.shade800,
                  header: const SizedBox.shrink(),
                  onRowPressed: (index, model) =>
                      controller.toggleExpandable(index),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (err) => Center(
                    child: Text('ERROR'),
                  ),
                  empty: () => const SizedBox.shrink(),
                  source: source,
                  onSelectionChanged: (index, item, isSelected) {
                    final range = source.getVisibleRange();
                    if (controller.selected.isNotEmpty) {
                      for (int i = range.first; i < range[1]; i++) {
                        controller.openSlidable(i);
                      }
                    } else {
                      for (int i = range.first; i < range[1]; i++) {
                        controller.closeSlidable(i);
                      }
                    }
                  },
                  columns: [
                    TableColumn(
                      label: const SizedBox.shrink(),
                      cellBuilder: (index, item) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Tooltip(
                              message: "Test",
                              child: Center(
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      size: TableColumnSize.fixed(200),
                    ),
                    TableColumn(
                      label: Center(
                        child: Text('Column 1'),
                      ),
                      cellBuilder: (index, item) {
                        return ValueListenableBuilder<List<Object>>(
                          valueListenable: controller.expanded,
                          builder: (_, expanded, __) {
                            final isExpanded =
                                !controller.retracted.contains(item.subtitle) &&
                                    (expanded.contains(item.subtitle) ||
                                        controller.isFullyExpanded.value);
                            return Center(
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: isExpanded ? Colors.red : null,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      canSort: true,
                    ),
                    TableColumn(
                      label: Center(
                        child: Text('Column 2'),
                      ),
                      cellBuilder: (index, item) => Center(
                        child: Text(
                          item.subtitle,
                        ),
                      ),
                      canSort: true,
                    ),
                    TableColumn(
                      label: Center(
                        child: Text('Column 3'),
                      ),
                      cellBuilder: (index, item) => Center(
                        child: Text(
                          'test',
                        ),
                      ),
                    ),
                    TableColumn(
                      label: Center(
                        child: Text('Column 4'),
                      ),
                      cellBuilder: (index, item) => Center(
                        child: Text(
                          'test',
                        ),
                      ),
                    ),
                    TableColumn(
                      label: Center(
                        child: Text('Column 5'),
                      ),
                      cellBuilder: (index, item) => Center(
                        child: Text(
                          'test',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
