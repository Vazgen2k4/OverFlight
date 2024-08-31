import 'package:flutter/material.dart';
import 'package:over_flight/router/router.dart';
import 'package:over_flight/ui/widgets/buttons/filled_button_widget.dart';
import 'package:over_flight/ui/widgets/buttons/google_button.dart';
import 'package:over_flight/ui/widgets/text_fields/input_form_widget.dart';
import 'package:over_flight/ui/widgets/title_section_widget.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
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
                    title: 'Sign up for an account',
                    subtitle: 'Hi, Enjoy your trip & easy book!',
                  ),
                  divider,
                  InputFormWidget(
                    controller: _emailController,
                    type: InputFormType.email,
                    title: "Email address",
                    placeholder: "Enter your email address",
                  ),
                  divider,
                  Hero(
                    tag: AppHeroTags.form,
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      child: InputFormWidget(
                        controller: _passwordController,
                        type: InputFormType.phone,
                        title: "Phone Number",
                        placeholder: "+1 111-222-3344",
                      ),
                    ),
                  ),
                  divider,
                  InputFormWidget(
                    controller: _passwordController,
                    type: InputFormType.password,
                    title: "Password",
                    placeholder: "Enter your password",
                  ),
                  divider,
                  divider,
                  FilledButtonWidget(
                    onPressed: () {
                      AppRouter.go(context, AppRoutes.phoneVerification);
                    },
                    label: "Продолжить",
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
}
