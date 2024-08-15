import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerUtil extends Logger {
  LogPrinter? printer;
  Level? level;

  LoggerUtil({
    @required this.printer,
    @required this.level,
  }) : super(
          printer: printer,
          level: level,
        );

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      e('[ERROR] $message', error: error, stackTrace: stackTrace);

  void warn(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      w('[WARN] $message', error: error, stackTrace: stackTrace);

  void info(dynamic message) => i('[INFO] $message');

  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      d('[DEBUG] $message', error: error, stackTrace: stackTrace);

  void verbose(dynamic message) => v('[VERBOSE]\n$message');

  static Level logLevel() {
    if (kReleaseMode) {
      return Level.nothing;
    }
    return Level.debug;
  }
}

LoggerUtil LOG = LoggerUtil(
  printer: PrettyPrinter(
    methodCount: 3,
    lineLength: 120,
    errorMethodCount: 8,
    printTime: true,
    printEmojis: true,
    colors: true,
  ),
  level: LoggerUtil.logLevel(),
);
