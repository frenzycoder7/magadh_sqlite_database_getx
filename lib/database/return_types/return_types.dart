class DataInsertionResponse {
  final bool allInserted;
  final bool anyFailed;
  final List<Map<String, dynamic>> failedData;
  final String? message;
  DataInsertionResponse({
    required this.allInserted,
    required this.anyFailed,
    required this.failedData,
    this.message,
  });
}

class DataUpdateResponse {
  final String? message;
  final bool isError;
  final Map<String, dynamic>? failedData;
  DataUpdateResponse({
    this.message,
    required this.isError,
    this.failedData,
  });
}

class DataDeleteResponse {
  final String? message;
  final bool isError;
  final Map<String, dynamic>? failedData;
  DataDeleteResponse({
    this.message,
    required this.isError,
    this.failedData,
  });
}