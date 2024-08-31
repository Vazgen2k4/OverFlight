import 'package:flutter/material.dart';
import 'package:over_flight/ui/theme/app_colors.dart';

class FilledButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double maxWidth;
  final String tag;

  const  FilledButtonWidget({
    super.key,
    required this.label,
    this.tag = "filled_button_teg",
    this.onPressed,
    this.maxWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: SizedBox(
        width: maxWidth,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              AppColors.main,
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.all(17),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
