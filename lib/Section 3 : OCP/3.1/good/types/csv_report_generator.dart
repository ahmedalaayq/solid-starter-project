import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_model.dart';

import 'report_generator.dart';

class CsvReportGenerator implements ReportGenerator {
  @override
  String generate(ReportModel data, ReportType type) {
    return '${data.title}\n${data.items.join(',')}';
  }

  @override
  ReportType get reportType => ReportType.csv;
}
