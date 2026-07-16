import 'logger.dart';

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = '[$timestamp] $message\n';

    print('Logged to console: $logEntry');
  }
  
  @override
  LoggerType get loggerType => LoggerType.console;
}
