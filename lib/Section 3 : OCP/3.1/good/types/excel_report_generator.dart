import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_model.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/types/report_generator.dart' show ReportGenerator, ReportType;

class ExcelReportGenerator implements ReportGenerator {
  @override
  String generate(ReportModel data, ReportType type) {
      return 'EXCEL:${data.title}|${data.items.join('|')}';

  }

  @override
  ReportType get reportType => ReportType.excel;
}