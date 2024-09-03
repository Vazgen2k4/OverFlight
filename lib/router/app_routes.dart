import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:over_flight/ui/pages/pages.dart';

abstract final class AppRoutes {
  const AppRoutes._();

  static const String start = '/';
  static const String auth = '/auth';
  static const String phoneVerification = '/auth/phoneVerification';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String init = start;

  static List<AppRoute> get routes {
    const routesList = <AppRoute>[
      AppRoute(page: StartPage(), path: start),
      AppRoute(page: AuthPage(), path: auth),
      AppRoute(page: PhoneVerification(), path: phoneVerification),
      AppRoute(page: HomePage(), path: home),
    ];

    return routesList.toSet().toList();
  }
}

class AppRoute extends Equatable {
  final Widget page;
  final String path;
  const AppRoute({
    required this.page,
    required this.path,
  });

  @override
  List<Object> get props => [path];
}
