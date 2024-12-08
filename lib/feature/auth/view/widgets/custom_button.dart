import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  VoidCallback onPressed;
   CustomButton({super.key, required this.txt,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;
    return InkWell(onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: spaces.space_700,
        decoration: BoxDecoration(color: colors.primary),
        child: Center(
            child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
