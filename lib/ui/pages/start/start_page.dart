import 'package:flutter/material.dart';
import 'package:over_flight/domain/middleware/auth_middleware.dart';
import 'package:over_flight/resources/resources.dart';
import 'package:over_flight/router/app_router.dart';
import 'package:over_flight/router/app_routes.dart';
import 'package:over_flight/ui/theme/app_colors.dart';
import 'package:over_flight/ui/widgets/buttons/filled_button_widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthMiddleware(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.asset(
                AppImages.startBg,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Flexible(
              flex: 1,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: AppColors.white),
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  children: [
                    const Center(
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          "Индивидуальный поиск билетов",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 38 / 28,
                            color: AppColors.title,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 31),
                    const Center(
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          "Путешествуйте легко и просто с приложением Over Flyght. Покупайте билеты используя лишь одно приложение",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.subtiitle,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 31),
                    Center(
                      child: FilledButtonWidget(
                        label: "Войти",
                        maxWidth: 279,
                        onPressed: () => AppRouter.go(context, AppRoutes.auth),
                      ),
                    ),
                    const SizedBox(height: 31),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.all(17),
                        ),
                      ),
                      child: const Text(
                        "Зарегистрироваться",
                        style: TextStyle(
                          color: AppColors.main,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
