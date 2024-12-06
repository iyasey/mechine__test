import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  const CustomButton({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;
    return Container(
      width: double.infinity,
      height: spaces.space_700,
      decoration: BoxDecoration(color: colors.primary),
      child: Center(
          child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      )),
    );
  }
}
