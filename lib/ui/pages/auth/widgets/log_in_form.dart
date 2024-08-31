import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:over_flight/ui/widgets/buttons/filled_button_widget.dart';
import 'package:over_flight/ui/widgets/buttons/google_button.dart';
import 'package:over_flight/ui/widgets/text_fields/input_form_widget.dart';
import 'package:over_flight/ui/widgets/title_section_widget.dart';

class LogInForm extends StatefulWidget {
  final VoidCallback onSubmit;
  final VoidCallback? onForgotPasword;

  const LogInForm({
    super.key,
    required this.onSubmit,
    this.onForgotPasword,
  });

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(height: 28);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          sliver: SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleSectionWidget(
                    title: 'Log in to your account',
                    subtitle: 'Hello, Welcome back!',
                  ),
                  divider,
                  InputFormWidget(
                    controller: _emailController,
                    type: InputFormType.email,
                    title: "Email address",
                    placeholder: "Enter your email address",
                  ),
                  divider,
                  InputFormWidget(
                    controller: _passwordController,
                    type: InputFormType.password,
                    title: "Password",
                    placeholder: "Enter your password",
                  ),
                  TextButton(
                    onPressed: _forgotPass,
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      side: BorderSide.none,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('Forgot password?'),
                  ),
                  divider,
                  FilledButtonWidget(
                    onPressed: _onSubmit,
                    label: "Войти",
                  ),
                  const SizedBox(height: 20),
                  const GoogleButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onSubmit() {
    final formState = _formKey.currentState;

    if (formState == null) {
      log("Не получили стейт формы");
      return;
    }

    if (!formState.validate()) {
      log("Валидация формы не прошла");
      return;
    }

    widget.onSubmit();
  }

  // TODO: сделать реализацию
  void _forgotPass() {}
}
