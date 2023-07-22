import 'package:get/get.dart';
import 'package:magadh_sqlite_database_getx/database/database_service.dart';
import 'package:magadh_sqlite_database_getx/database/exceptions/database_exception.dart';
import 'package:magadh_sqlite_database_getx/database/extensions/extensions.dart';
import 'package:magadh_sqlite_database_getx/database/manager/database_controller.dart';
import 'package:magadh_sqlite_database_getx/database/manager/database_controller_implementation.dart';
import 'package:magadh_sqlite_database_getx/database/return_types/return_types.dart';

class DatabaseServiceImpl implements DatabaseService {
  late DatabaseController _controller;
  final String databasePath;

  DatabaseServiceImpl({required this.databasePath, required List<String> queries}) {
    "Implementing Database Service".log();
    "DATABASE PATH: $databasePath".log();
    _controller = Get.put(DatabaseControllerImplementation());
    _controller.init(
      queries: queries,
      databasePath: databasePath,
    );
  }

  @override
  bool get isOpen => _controller.isOpen;

  @override
  Future<DataInsertionResponse> insert(
    String tableName,
    List<Map<String, dynamic>> json,
  ) async {
    List<Map<String, dynamic>> failedData = [];

    for (var data in json) {
      try {
        int id = await _controller.insert(tableName, data);
        "Data inserted with id: $id".log();
      } on InsertionException catch (e) {
        "Error while inserting data: $e".log();
        failedData.add(data);
      } catch (e) {
        rethrow;
      }
    }

    return DataInsertionResponse(
      allInserted: failedData.isEmpty,
      failedData: failedData,
      anyFailed: failedData.isNotEmpty,
      message: failedData.isNotEmpty
          ? "Data insertion failed for ${failedData.length} records and inserted for ${json.length - failedData.length} records"
          : "Data inserted successfully",
    );
  }
  
  @override
  Function(String p1, {List<String>? columns, bool? distinct, String? groupBy, String? having, int? limit, int? offset, String? orderBy, String? where, List<Object?>? whereArgs}) query() => _controller.query; 
}
