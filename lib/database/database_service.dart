import 'package:magadh_sqlite_database_getx/database/return_types/return_types.dart';

abstract class DatabaseService {
  bool get isOpen;
  Future<DataInsertionResponse> insert(
    String tableName,
    List<Map<String, dynamic>> json,
  );

  Function(
    String, {
    List<String>? columns,
    bool? distinct,
    String? groupBy,
    String? having,
    int? limit,
    int? offset,
    String? orderBy,
    String? where,
    List<Object?>? whereArgs,
  }) query();
}
