class ReportModel {
  final String title;
  final List<String> items;
  final DateTime generatedAt;

  ReportModel({
    required this.title,
    required this.items,
    required this.generatedAt,
  });
}
