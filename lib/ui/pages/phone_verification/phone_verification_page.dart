// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:over_flight/domain/middleware/auth_middleware.dart';
import 'package:over_flight/router/app_hero_tags.dart';
import 'package:over_flight/ui/theme/app_colors.dart';

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
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Phone Verification',
                    style: textStyle.titleLarge,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      'We have sent code to your number',
                      style: textStyle.titleMedium,
                    ),
                  ),
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

class VerificationFormWidget extends StatelessWidget {
  const VerificationFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: AppHeroTags.form,
      child: Material(
        child: Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ConfirmTextFieldWidget(),
              ConfirmTextFieldWidget(),
              ConfirmTextFieldWidget(),
              ConfirmTextFieldWidget(),
              ConfirmTextFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmTextFieldWidget extends StatelessWidget {
  final double width;

  const ConfirmTextFieldWidget({
    super.key,
    this.width = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: TextFormField(
        maxLength: 1,
        buildCounter: (
          _, {
          required int currentLength,
          required bool isFocused,
          required int? maxLength,
        }) =>
            null,
        validator: (_) => null,
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus(); // Переход к следующему полю
          }
        },
        textInputAction: TextInputAction.next,
        cursorWidth: 0,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(color: AppColors.title),
        textAlign: TextAlign.center,
        focusNode: FocusNode(skipTraversal: true), // Отключаем вывод клавиатуры
        showCursor: false,
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.border,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.main,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomKeyBoard extends StatelessWidget {
  const CustomKeyBoard({super.key});

  KeyBoardButtonData generator(int index) {
    if (index == 9) {
      return KeyBoardButtonData(
        type: KeyBoardButtonType.none,
        value: null,
      );
    }

    if (index == 11) {
      return KeyBoardButtonData(
        type: KeyBoardButtonType.backspace,
        value: null,
      );
    }

    return KeyBoardButtonData(
      type: KeyBoardButtonType.number,
      value: index < 9 ? '${index + 1}' : '0',
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<KeyBoardButtonData> list = List.generate(12, generator);

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 60,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (_, index) {
        return KeyBoardButtonWidget(
          data: list[index],
        );
      },
    );
  }
}

class KeyBoardButtonWidget extends StatelessWidget {
  final KeyBoardButtonData data;

  const KeyBoardButtonWidget({
    super.key,
    required this.data,
  });

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
      onPressed: () {},
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

enum KeyBoardButtonType { number, backspace, none }

class KeyBoardButtonData {
  final KeyBoardButtonType type;
  final String? value;

  KeyBoardButtonData({
    required this.type,
    required this.value,
  });
}
