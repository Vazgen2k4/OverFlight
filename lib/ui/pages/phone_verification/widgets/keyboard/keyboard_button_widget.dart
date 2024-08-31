import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:over_flight/ui/theme/app_colors.dart';
import 'package:over_flight/ui/pages/phone_verification/widgets/keyboard/keyboard.dart';


class KeyBoardButtonWidget extends StatelessWidget {
  final KeyBoardButtonData data;

  const KeyBoardButtonWidget({
    super.key,
    required this.data,
  });

  void onCompleat() {
    if (data.type != KeyBoardButtonType.number) return;

    log('${data.value}');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;

    if (data.type == KeyBoardButtonType.none) {
      return const SizedBox();
    }

    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          AppColors.main,
        ),
      ),
      onPressed: onCompleat,
      icon: switch (data.type) {
        KeyBoardButtonType.number => Text(
            data.value ?? '',
            style: textStyle.titleLarge?.copyWith(color: AppColors.white),
          ),
        KeyBoardButtonType.backspace => const Icon(
            Icons.backspace,
            color: AppColors.white,
          ),
        KeyBoardButtonType.none => const SizedBox(),
      },
    );
  }
}
