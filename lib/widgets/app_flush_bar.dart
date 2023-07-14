import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';
import 'package:vba_crypto_signal/models/failure.dart';
import '../core/services/navigation_service.dart';

class AppFlushBar {
  static void showFailure({
    required Failure failure,
    bool showTitle = true,
    Color? color,
    Duration? duration,
  }) {
    Flushbar<dynamic>(
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: color ?? Colors.red.shade600,
      margin: const EdgeInsets.all(2),
      borderRadius: BorderRadius.circular(8),
      message: failure.message,
      title: showTitle ? failure.title : null,
    ).show(NavigationService.instance.navigatorKey.currentContext!);
  }

  /// show success indication
  static void showSuccess({
    required String message,
    String? title,
    Color? color,
    Duration? duration,
  }) {
    Flushbar<dynamic>(
      flushbarPosition: FlushbarPosition.TOP,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: color ?? Colors.green.shade600,
      margin: const EdgeInsets.all(2),
      borderRadius: BorderRadius.circular(8),
      message: message,
      title: title,
    ).show(NavigationService.instance.navigatorKey.currentContext!);
  }

  static void showGeneric({
    required String message,
    String? title,
    Color? color,
    Duration? duration,
  }) {
    Flushbar<dynamic>(
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: color ?? AppColors.gold,
      margin: const EdgeInsets.all(2),
      borderRadius: BorderRadius.circular(8),
      message: message,
      title: title,
    ).show(NavigationService.instance.navigatorKey.currentContext!);
  }
}
