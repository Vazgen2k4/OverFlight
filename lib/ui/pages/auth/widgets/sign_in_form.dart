import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:over_flight/resources/resources.dart';
import 'package:over_flight/router/app_hero_tags.dart';
import 'package:over_flight/router/app_router.dart';
import 'package:over_flight/router/app_routes.dart';
import 'package:over_flight/ui/widgets/buttons/filled_button_widget.dart';
import 'package:over_flight/ui/widgets/text_fields/input_form_widget.dart';

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
                      'Sign up for an account',
                      style: textStyle.titleLarge,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Hi, Enjoy your trip & easy book!',
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
                  TextButton(
                    onPressed: () {},
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
                    onPressed: () =>
                        AppRouter.go(context, AppRoutes.phoneVerification),
                    label: "Продолжить",
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {},
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
}
