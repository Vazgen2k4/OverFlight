import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleSectionWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: textStyle.titleLarge,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Text(
          subtitle,
          style: textStyle.titleMedium,
        ),
      ),
    );
  }
}
