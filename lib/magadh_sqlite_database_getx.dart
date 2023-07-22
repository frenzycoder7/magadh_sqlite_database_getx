library magadh_sqlite_database_getx;

import 'package:sqflite/sqflite.dart';

export './database/return_types/return_types.dart';
export './database/database_service.dart';
export './database/database_service_impl.dart';
export './database/manager/datatypes.dart';
export './database/exceptions/database_exception.dart';

Future<String> fetchDatabasePath() async {
  return await getDatabasesPath();
}
