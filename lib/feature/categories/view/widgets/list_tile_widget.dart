import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/app_theme.dart';

class ListTileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? ontap;
  const ListTileWidget({
    super.key,
    required this.text,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;

    final typography = AppTheme.of(context).typography;
    return ListTile(
        onTap: ontap,
        leading: Icon(
          icon,
          color: colors.text,
        ),
        title: Text(
          text,
          style: typography.h400.copyWith(color: colors.text),
        ));
  }
}
