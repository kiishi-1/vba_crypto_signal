import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService get instance => _instance;
  static final NavigationService _instance = NavigationService._();
  NavigationService._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? argument}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> navigateToReplace(String routeName, {Object? argument}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> navigateToReplaceAll(String routeName, {Object? argument}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: argument);
  }

  void navigateToReplaceUntil(String routeName) {
    return navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  Future<dynamic> logOut(String routeName, {Object? argument}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: argument);
  }

  void goBack<T extends Object?>([T? result]) {
    Navigator.of(navigatorKey.currentState!.context).pop(result);
  }
}
