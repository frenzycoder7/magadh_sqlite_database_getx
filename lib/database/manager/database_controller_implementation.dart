import 'package:magadh_sqlite_database_getx/database/exceptions/database_exception.dart';
import 'package:magadh_sqlite_database_getx/database/extensions/extensions.dart';
import 'package:magadh_sqlite_database_getx/database/manager/database_controller.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseControllerImplementation implements DatabaseController {
  late Database db;
  @override
  void init({required List<String> queries, required String databasePath}) {
    "Implementing Database Controller".log();
    _connectDatabase(query: queries, databasePath: databasePath);
  }

  _connectDatabase({
    required List<String> query,
    required String databasePath,
  }) async {
    "Opening Database".log();
    await deleteDatabase(databasePath);
    try {
      db = await openDatabase(
        databasePath,
        version: 1,
        onCreate: (Database db, int version) async {
          for (String element in query) {
            "RUNNING QUERY $element".log();
            await db.execute(element);
            "Query Executed".log();
          }
        },
      );
    } catch (e) {
      "Error while opening database: $e".log();
    }
  }

  @override
  bool get isOpen => db.isOpen;

  @override
  Future<int> insert(String tableName, Map<String, dynamic> json) async {
    if (isOpen.isFalse) {
      "Database is not open".log();
      throw DatabaseConnectionException(
          "Database is not open or not initialized");
    }
    try {
      return await db.insert(tableName, json);
    } catch (e) {
      "Error while inserting data: $e".log();
      throw InsertionException(
        "Error while inserting data in $tableName",
        e.toString(),
        json,
      );
    }
  }

  @override
  Function(String,
      {List<String>? columns,
      bool? distinct,
      String? groupBy,
      String? having,
      int? limit,
      int? offset,
      String? orderBy,
      String? where,
      List<Object?>? whereArgs}) get query => db.query;

  @override
  Future<int> update(
    String tableName,
    Map<String, dynamic> json, {
    String? where,
    List<Object?>? whereArgs,
  }) {
    if (isOpen.isFalse) {
      "Database is not open".log();
      throw DatabaseConnectionException(
          "Database is not open or not initialized");
    }
    try {
      return db.update(tableName, json, where: where, whereArgs: whereArgs);
    } catch (e) {
      "Error while updating data: $e".log();
      throw UpdateException("Error while updating data in $tableName");
    }
  }

  @override
  Future<int> delete(String tableName,
      {String? where, List<Object?>? whereArgs}) {
    if (isOpen.isFalse) {
      "Database is not open".log();
      throw DatabaseConnectionException(
          "Database is not open or not initialized");
    }
    try {
      return db.delete(tableName, where: where, whereArgs: whereArgs);
    } catch (e) {
      "Error while deleting data: $e".log();
      throw DataDeleteException("Error while deleting data in $tableName");
    }
  }
}
