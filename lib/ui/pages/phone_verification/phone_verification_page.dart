import 'package:flutter/material.dart';
import 'package:over_flight/domain/middleware/auth_middleware.dart';
import 'package:over_flight/ui/pages/phone_verification/widgets/widgets.dart';
import 'package:over_flight/ui/theme/app_colors.dart';
import 'package:over_flight/ui/widgets/title_section_widget.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;
    const divider = SizedBox(height: 35);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 72,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
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
                Icons.arrow_back_ios_new,
                size: 16,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: AuthMiddleware(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 13,
              horizontal: 24,
            ),
            child: Column(
              children: [
                const TitleSectionWidget(
                  title: 'Phone Verification',
                  subtitle: 'We have sent code to your number',
                ),
                divider,
                const VerificationFormWidget(),
                divider,
                Row(
                  children: [
                    Text(
                      'Didn’t receive code?',
                      style: textStyle.titleMedium,
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend',
                        style: textStyle.titleMedium?.copyWith(
                          color: AppColors.main,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const CustomKeyBoard(),
                divider,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
