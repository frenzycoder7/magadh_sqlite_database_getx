library magadh_sqlite_database_getx;

import 'package:get/get.dart';
import 'package:magadh_sqlite_database_getx/database/database_service.dart';
import 'package:magadh_sqlite_database_getx/database/database_service_impl.dart';
import 'package:sqflite/sqflite.dart';

export './database/return_types/return_types.dart';
export './database/manager/datatypes.dart';
export './database/exceptions/database_exception.dart';

Future<String> fetchDatabasePath() async {
  return await getDatabasesPath();
}

Future<void> initilizeDatabase({
  required List<String> queries,
  required String databaseName,
}) async {
  String databasePath = await fetchDatabasePath();
  String path = "$databasePath/$databaseName.db";
  Get.put(DatabaseServiceImpl(databasePath: path, queries: queries));
}

DatabaseService get databaseService => Get.find<DatabaseServiceImpl>();
