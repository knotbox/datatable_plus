import 'package:datatable_plus/src/data_table_plus_source.dart';
import 'package:datatable_plus/src/models/page_request.dart';

class TestSource extends DataTablePlusSource<Map<String, dynamic>> {
  @override
  Future<List<Map<String, dynamic>>> fetchPage(PageRequest request) {
    return Future.value(
      List.generate(
        30,
        (index) => <String, dynamic>{},
      ),
    );
  }

  @override
  int get rowCount => 30;

  @override
  bool get rowsExpandable => false;
}
