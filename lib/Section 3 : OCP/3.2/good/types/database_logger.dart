import 'logger.dart';

class DatabaseLogger implements Logger {
  @override
  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = '[$timestamp] $message\n';

    print('Logged to database: $logEntry');
  }
  
  @override
  LoggerType get loggerType => LoggerType.database;
}
