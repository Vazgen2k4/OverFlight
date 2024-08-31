import 'package:flutter/material.dart';
import 'package:over_flight/ui/pages/auth/auth.dart';
import 'package:over_flight/ui/theme/app_colors.dart';

class AuthPageContent extends StatefulWidget {
  const AuthPageContent({super.key});

  @override
  State<AuthPageContent> createState() => _AuthPageContentState();
}

class _AuthPageContentState extends State<AuthPageContent>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(
        milliseconds: 200,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar.secondary(
          dividerColor: AppColors.border,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Log in'),
            Tab(text: 'Sing up'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              LogInForm(
                onSubmit: () {},
              ),
              const SignInFormWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
