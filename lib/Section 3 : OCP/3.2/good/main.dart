import 'package:solid_examples/Section%203%20:%20OCP/3.2/good/logger_service.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.2/good/types/console_logger.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.2/good/types/database_logger.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.2/good/types/file_logger.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.2/good/types/logger.dart';
import 'package:solid_examples/Section%203%20:%20OCP/3.2/good/types/server_logger.dart';

void main() {
  final LoggerService loggerService = LoggerService(
    loggerList: [
      FileLogger(filePath: "app.log"),
      ConsoleLogger(),
      DatabaseLogger(),
      ServerLogger(),
    ],
  );
  loggerService.log(message: "delete row", type: LoggerType.database);
}
