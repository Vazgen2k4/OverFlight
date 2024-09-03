import 'package:over_flight/router/app_routes.dart';
import 'package:over_flight/router/error_404_page/error_404_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const _pageDuration = Duration(milliseconds: 400);
  static String get initRoute => AppRoutes.init;

  static Route generate(RouteSettings settings) {
    final routeName = settings.name?.trim();
    if (routeName == null) return _errorRoute404;
    final allAppRoutes = AppRoutes.routes;

    for (var appRoute in allAppRoutes) {
      if (routeName != appRoute.path) continue;

      final newRoute = _getRouteTemplate(
        child: appRoute.page,
        settings: settings,
      );

      return newRoute;
    }

    return _errorRoute404;
  }

  static Route _getRouteTemplate({
    required Widget child,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: _pageDuration,
      reverseTransitionDuration: _pageDuration,
      pageBuilder: (_, __, ___) => child,
    );
  }

  static final Route _errorRoute404 = MaterialPageRoute(
    settings: const RouteSettings(name: '/404'),
    builder: (_) => const Error404Page(),
  );

  static Future<T?> go<T>(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamed(route, arguments: arguments);
  }

  static Future<T?> goWithRemove<T>(
    BuildContext context,
    String route, {
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      (_) => false,
      arguments: arguments,
    );
  }
}
