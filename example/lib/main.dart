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

  @override
  void dispose() {
    source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datatable Plus'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: DataTablePlus<Model>(
            header: Container(),
            expandableKey: (index, model) => ObjectKey(model?.subtitle),
            onRowPressed: (index, model) => source.toggleExpansion(
              ObjectKey(model?.subtitle),
            ),
            expandedRow: (index, item) {
              return Container(height: 100, color: Colors.purple);
            },
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            error: (err) => Center(
              child: Text('ERROR'),
            ),
            empty: () => SizedBox.shrink(),
            source: source,
            columns: [
              TableColumn(
                label: Center(
                  child: Text('Column 1'),
                ),
                cellBuilder: (item) => Center(
                  child: Text(
                    item.title,
                  ),
                ),
                canSort: true,
              ),
              TableColumn(
                label: Center(
                  child: Text('Column 2'),
                ),
                cellBuilder: (item) => Center(
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
                cellBuilder: (item) => Center(
                  child: Text(
                    'test',
                  ),
                ),
              ),
              TableColumn(
                label: Center(
                  child: Text('Column 4'),
                ),
                cellBuilder: (item) => Center(
                  child: Text(
                    'test',
                  ),
                ),
              ),
              TableColumn(
                label: Center(
                  child: Text('Column 5'),
                ),
                cellBuilder: (item) => Center(
                  child: Text(
                    'test',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
