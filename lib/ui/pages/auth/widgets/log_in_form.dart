import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:over_flight/resources/resources.dart';
import 'package:over_flight/ui/widgets/buttons/filled_button_widget.dart';
import 'package:over_flight/ui/widgets/text_fields/input_form_widget.dart';

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
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;

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
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Log in to your account',
                      style: textStyle.titleLarge,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Hello, Welcome back!',
                        style: textStyle.titleMedium,
                      ),
                    ),
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
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: _forgotPass,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 17),
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Color(0xffEAEFF3),
                          ),
                        ),
                      ),
                      icon: SvgPicture.asset(AppIcons.google),
                      label: Text(
                        'Sign Up with Google',
                        style: textStyle.titleMedium,
                      ),
                    ),
                  ),
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
