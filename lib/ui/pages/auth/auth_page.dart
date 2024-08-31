import 'package:flutter/material.dart';
import 'package:over_flight/domain/middleware/auth_middleware.dart';
import 'package:over_flight/ui/pages/auth/widgets/auth_page_content.dart';
import 'package:over_flight/ui/theme/app_colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: IconButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        width: 1,
                        color: AppColors.border,
                      ),
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                icon: const Icon(
                  Icons.clear_sharp,
                  size: 24,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
      body: const AuthMiddleware(
        child: SafeArea(child: AuthPageContent()),
      ),
    );
  }
}
