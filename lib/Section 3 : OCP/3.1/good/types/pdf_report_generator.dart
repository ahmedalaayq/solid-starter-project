import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_model.dart';

import 'report_generator.dart';

class PdfReportGenerator implements ReportGenerator {
  @override
  String generate(ReportModel data, ReportType type) {
    return 'PDF Report: ${data.title}\n${data.items.join('\n')}';
  }

  @override
  ReportType get reportType => ReportType.pdf;
}
