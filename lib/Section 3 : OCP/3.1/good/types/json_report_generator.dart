import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_model.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/types/report_generator.dart';

class JsonReportGenerator implements ReportGenerator {
  @override
  String generate(ReportModel data, ReportType type) {
      return '{"title":"${data.title}", "items":"${data.items}"}';

  }

  @override
  ReportType get reportType => ReportType.json;
}