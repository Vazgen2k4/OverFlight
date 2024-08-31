import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:over_flight/resources/resources.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;
    return SizedBox(
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
    );
  }
}
