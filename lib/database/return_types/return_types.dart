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
