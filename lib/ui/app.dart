import 'package:flutter/material.dart';
import 'package:over_flight/router/app_router.dart';
import 'package:over_flight/ui/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initRoute,
      onGenerateRoute: AppRouter.generate,
      theme: AppTheme.light,
    );
  }
}
