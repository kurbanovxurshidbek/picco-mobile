import 'package:logger/logger.dart';
import 'location_service.dart';

class Log {
  static final Logger _logger = Logger(printer: PrettyPrinter());

  static void d(String message) {
    if (LocationService.isTester) _logger.d(message);
  }

  static void i(String message) {
    if (LocationService.isTester) _logger.i(message);
  }

  static void w(String message) {
    if (LocationService.isTester) _logger.w(message);
  }

  static void e(String message) {
    if (LocationService.isTester) _logger.e(message);
  }
}