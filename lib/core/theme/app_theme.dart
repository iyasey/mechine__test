import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/extension/color_extension.dart';
import 'package:mechine___test/core/theme/extension/space_extension.dart';
import 'package:mechine___test/core/theme/extension/typography_extension.dart';

final class AppTheme {
  final BuildContext context;

  AppTheme.of(this.context);

  AppColorExtension get colors {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
}
}