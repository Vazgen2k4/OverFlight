import 'package:flutter/material.dart';
import 'package:over_flight/ui/theme/app_colors.dart';

class ConfirmTextFieldWidget extends StatefulWidget {
  final double width;
  final TextEditingController controller;
  final bool haveInitFocus;

  const ConfirmTextFieldWidget({
    super.key,
    this.width = 50,
    required this.controller,
    this.haveInitFocus = false,
  });

  @override
  State<ConfirmTextFieldWidget> createState() => _ConfirmTextFieldWidgetState();
}

class _ConfirmTextFieldWidgetState extends State<ConfirmTextFieldWidget> {
  final FocusNode _focusNode = FocusNode(skipTraversal: true);

  @override
  void initState() {
    super.initState();

    if (widget.haveInitFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.width,
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
        focusNode: _focusNode, // Отключаем вывод клавиатуры
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