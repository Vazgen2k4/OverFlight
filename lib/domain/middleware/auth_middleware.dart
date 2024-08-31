import 'package:flutter/cupertino.dart';

class AuthMiddleware extends StatelessWidget {
  final Widget? child;
  const AuthMiddleware({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: child,
    );
  }
}