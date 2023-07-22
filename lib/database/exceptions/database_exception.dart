class InsertionException implements Exception {
  final String message;
  final String? dbErrorMessage;
  final Map<String, Object?> data;
  InsertionException(this.message, this.dbErrorMessage, this.data);
}

class DatabaseConnectionException implements Exception {
  final String message;
  DatabaseConnectionException(this.message);
}

class UpdateException implements Exception {
  final String message;

  UpdateException(this.message);
}

class RecordsNotFound implements Exception {
  final String message;

  RecordsNotFound(this.message);
}

class DataDeleteException implements Exception {
  final String message;

  DataDeleteException(this.message);
}
