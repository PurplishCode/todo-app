import 'package:logger/logger.dart';

class AppLogger {
  static final Logger logger = Logger(printer: PrettyPrinter());

  static void logInfo(String message) {
    logger.i(message);
  }

  static void logError(String message) {
    logger.e(message);
  }
  static void logWarning(String message) {
    logger.w(message);
  }
}