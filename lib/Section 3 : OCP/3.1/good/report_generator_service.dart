import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/report_model.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.1/good/types/report_generator.dart';

class ReportGeneratorService {
  ReportGeneratorService({required this.reportGeneratorList});
  final List<ReportGenerator> reportGeneratorList;

  String generator(ReportModel data, ReportType type) {
    final report = reportGeneratorList.firstWhere((e) => e.reportType == type);
    return report.generate(data, type);
  }
}
