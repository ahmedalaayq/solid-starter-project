import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_model.dart';

enum ReportType { pdf, html, csv, excel, json }

abstract interface class ReportGenerator {
  ReportType get reportType;
  String generate(ReportModel data, ReportType type);
}
