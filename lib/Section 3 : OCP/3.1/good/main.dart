import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_generator_service.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_model.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/types/csv_report_generator.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/types/excel_report_generator.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/types/html_report_generator.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/types/json_report_generator.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/types/pdf_report_generator.dart';

import 'types/report_generator.dart';

void main() {
  final ReportGeneratorService reportGeneratorService = ReportGeneratorService(
    reportGeneratorList: [
      PdfReportGenerator(),
      ExcelReportGenerator(),
      CsvReportGenerator(),
      JsonReportGenerator(),
      HtmlReportGenerator(),
    ],
  );

  final data = ReportModel(
    title: 'Sales Report',
    items: ['Product A: \$100', 'Product B: \$200', 'Product C: \$150'],
    generatedAt: DateTime.now(),
  );
  print(reportGeneratorService.generator(data, ReportType.json));
}
