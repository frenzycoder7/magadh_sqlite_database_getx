abstract class DatabaseController {
  void init({required List<String> queries, required String databasePath});
  bool get isOpen;
  Future<int> insert(String tableName, Map<String, dynamic> json);
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
  }) get query;
}
