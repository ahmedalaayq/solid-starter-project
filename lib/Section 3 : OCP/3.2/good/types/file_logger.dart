import 'dart:io';

import 'logger.dart';

class FileLogger implements Logger {
  FileLogger({required this.filePath});
  final String filePath;

  @override
  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = '[$timestamp] $message\n';

    File(filePath).writeAsStringSync(logEntry, mode: FileMode.append);
    print('Logged to file: $logEntry');
  }
  
  @override
  LoggerType get loggerType => LoggerType.file;
}
