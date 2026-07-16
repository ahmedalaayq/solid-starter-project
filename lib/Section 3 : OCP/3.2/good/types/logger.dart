enum LoggerType { file, console, server, database }

abstract interface class Logger {
  LoggerType get loggerType;
  void log(String message);
}
