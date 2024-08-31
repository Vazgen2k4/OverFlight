import 'package:flutter/material.dart';
import 'package:over_flight/router/router.dart';
import 'package:over_flight/ui/pages/phone_verification/widgets/confirm_text_field_widget.dart';

class VerificationFormWidget extends StatefulWidget {
  const VerificationFormWidget({
    super.key,
  });

  @override
  State<VerificationFormWidget> createState() => _VerificationFormWidgetState();
}

class _VerificationFormWidgetState extends State<VerificationFormWidget> {
  List<TextEditingController> controllerList = [];

  @override
  void initState() {
    super.initState();
    controllerList = List.generate(5, (_) => TextEditingController());
  }

  @override
  void dispose() {
    super.dispose();

    for (var controller in controllerList) {
      controller.dispose;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AppHeroTags.form,
      child: Material(
        child: Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(controllerList.length, (index) {
              return ConfirmTextFieldWidget(
                controller: controllerList[index],
                haveInitFocus: index == 0,
              );
            }),
          ),
        ),
      ),
    );
  }
}
