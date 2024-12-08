
import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/color_palette.dart';
import 'package:mechine___test/core/theme/extension/color_extension.dart';
import 'package:mechine___test/core/theme/extension/space_extension.dart';
import 'package:mechine___test/core/theme/extension/typography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


final darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: [
    AppColorExtension(
      primary: AppColorPalettes.white,
      secondary: AppColorPalettes.white500,
      text: AppColorPalettes.white500,
      textInverse: AppColorPalettes.blue900,
      textSubtle: AppColorPalettes.gray300,
      textSubtlest: AppColorPalettes.grey400,
      textDisabled: AppColorPalettes.grey350,
      bottomNavBorder: AppColorPalettes.grey350.withOpacity(0.2),
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalettes.white500,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalettes.grey400,
    ),
  ],
);

