import 'package:flutter/foundation.dart';

/// 日志级别
enum LogLevel {
  debug,
  info,
  warning,
  error,
}

/// 简易日志服务
/// 在 Debug 模式下输出到控制台，Release 模式下可扩展对接 Sentry 等服务
class LoggerService {
  LoggerService._();

  static final LoggerService _instance = LoggerService._();
  static LoggerService get instance => _instance;

  /// 最小日志级别，低于此级别的日志不输出
  LogLevel minLevel = kDebugMode ? LogLevel.debug : LogLevel.warning;

  /// Debug 级别日志
  void debug(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.debug, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  /// Info 级别日志
  void info(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.info, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  /// Warning 级别日志
  void warning(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.warning, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  /// Error 级别日志
  void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  void _log(
    LogLevel level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (level.index < minLevel.index) return;

    final prefix = _getLevelPrefix(level);
    final tagStr = tag != null ? '[$tag] ' : '';
    final timestamp = DateTime.now().toIso8601String().substring(11, 23);

    final logMessage = '$timestamp $prefix $tagStr$message';

    if (kDebugMode) {
      // ignore: avoid_print
      print(logMessage);
      if (error != null) {
        // ignore: avoid_print
        print('  Error: $error');
      }
      if (stackTrace != null) {
        // ignore: avoid_print
        print('  StackTrace:\n$stackTrace');
      }
    }

    // TODO: 在 Release 模式下对接 Sentry 或其他错误监控服务
    // if (!kDebugMode && level == LogLevel.error) {
    //   Sentry.captureException(error, stackTrace: stackTrace);
    // }
  }

  String _getLevelPrefix(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return '[D]';
      case LogLevel.info:
        return '[I]';
      case LogLevel.warning:
        return '[W]';
      case LogLevel.error:
        return '[E]';
    }
  }
}

/// 全局日志快捷方法
final logger = LoggerService.instance;
