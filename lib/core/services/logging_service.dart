import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

class LoggingService {
  static final LoggingService _instance = LoggingService._internal();
  late final Logger _logger;

  factory LoggingService() {
    return _instance;
  }

  LoggingService._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
      level: kDebugMode ? Level.verbose : Level.info,
    );
  }

  void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error: error, stackTrace: stackTrace);
  }

  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.wtf(message, error: error, stackTrace: stackTrace);
  }
}
