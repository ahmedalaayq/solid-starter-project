import 'types/logger.dart';

class LoggerService {
  LoggerService({required this.loggerList});
  final List<Logger> loggerList;

  void log({
    required String message,
    required LoggerType type,
    String? filePath,
  }) {
    final logger = loggerList.firstWhere((e) => e.loggerType == type);
    logger.log(message);
  }
}
