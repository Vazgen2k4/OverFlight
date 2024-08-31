import 'package:flutter/material.dart';
import 'package:over_flight/ui/theme/app_colors.dart';
import 'package:over_flight/ui/theme/app_text_styles.dart';
import 'package:over_flight/ui/validator/app_validator.dart';

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder; 
  final String title;
  final InputFormType type;
  final double titleSpacing;

  static const _icons = <InputFormType, InputFormTypeData>{
    InputFormType.email: InputFormTypeData(
      icon: Icons.mail_outline_outlined,
      validator: AppValidator.email,
    ),
    InputFormType.password: InputFormTypeData(
      icon: Icons.lock_outline,
      validator: AppValidator.password,
    ),
    InputFormType.phone: InputFormTypeData(
      icon: Icons.phone_outlined,
      validator: AppValidator.phoneNumber,
    ),
    InputFormType.init: InputFormTypeData(
      icon: Icons.text_fields_outlined,
      validator: AppValidator.required,
    ),
  };

  const InputFormWidget({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.title,
    this.titleSpacing = 12,
    this.type = InputFormType.init,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title.trim(), style: AppTextStyles.inputTitle),
        SizedBox(height: titleSpacing),
        TextFormField(
          validator: _icons[type]?.validator,
          textCapitalization: TextCapitalization.words,
          style: AppTextStyles.inputTitle.copyWith(fontWeight: FontWeight.w500),
          obscureText: type == InputFormType.password,
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: AppTextStyles.subtitle,
            prefixIcon: Icon(
              _icons[type]?.icon,
              color: AppColors.items,
              size: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.main),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }
}

enum InputFormType {
  init,
  password,
  email,
  phone,
}

class InputFormTypeData {
  final IconData icon;
  final String? Function(String?) validator;

  const InputFormTypeData({
    required this.icon,
    required this.validator,
  });
}
