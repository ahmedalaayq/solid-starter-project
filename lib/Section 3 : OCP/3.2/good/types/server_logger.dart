import 'logger.dart';

class ServerLogger implements Logger {
  @override
  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = '[$timestamp] $message\n';
    print('Logged to server: $logEntry');
  }
  
  @override
  LoggerType get loggerType => LoggerType.server;
}
