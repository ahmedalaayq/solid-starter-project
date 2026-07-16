import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_model.dart';

import 'report_generator.dart';

class HtmlReportGenerator implements ReportGenerator {
  @override
  String generate(ReportModel data, ReportType type) {
    return '<html><h1>${data.title}</h1><ul>${data.items.map((item) => '<li>$item</li>').join()}</ul></html>';


  }

  @override
  ReportType get reportType => ReportType.html;
}