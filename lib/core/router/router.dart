import 'package:flutter/material.dart';
import 'package:vba_crypto_signal/core/constants/routing_constants.dart';
import 'package:vba_crypto_signal/core/router/routing_argument_keys.dart';
import 'package:vba_crypto_signal/views/authentication/login/login_view.dart';
import 'package:vba_crypto_signal/views/dashboard/dashboard_view.dart';
import 'package:vba_crypto_signal/views/home/home.dart';

class AppRouter {
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
  }) {
    return MaterialPageRoute(
        builder: (context) => viewToShow, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> routeArgs = settings.arguments != null
        ? settings.arguments as Map<String, dynamic>
        : {};

    switch (settings.name) {
      case NavigatorRoutes.loginView:
        return _getPageRoute(
          settings: settings,
          viewToShow: const LoginView(),
        );
      case NavigatorRoutes.dashboardView:
        return _getPageRoute(
          settings: settings,
          viewToShow: const DashboardView(),
        );
      case NavigatorRoutes.home:
        return _getPageRoute(
          settings: settings,
          viewToShow: const Home(),
        );

      default:
        return _getPageRoute(
          settings: settings,
          viewToShow: const Scaffold(),
        );
    }
  }
}
