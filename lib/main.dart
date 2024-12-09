import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechine___test/core/theme/color_palette.dart';
import 'package:mechine___test/core/theme/extension/color_extension.dart';
import 'package:mechine___test/core/theme/extension/space_extension.dart';
import 'package:mechine___test/core/theme/extension/typography_extension.dart';
import 'package:mechine___test/feature/auth/controller/auth_controller.dart';
import 'package:mechine___test/feature/auth/view/pages/signup_page.dart';
import 'package:mechine___test/feature/categories/view/pages/categories_page.dart';
import 'package:mechine___test/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: AppColorPalettes.black,
        extensions: <ThemeExtension<dynamic>>[
          AppSpaceExtension.fromBaseSpace(8),
          AppTypographyExtension.fromColors(
            defaultFontColor: Colors.black,
            linkColor: Colors.blue,
            dimFontColor: Colors.grey,
          ),
          AppColorExtension(
            primary: AppColorPalettes.black,
            secondary: AppColorPalettes.grey1000,
            text: Colors.white,
            textInverse: const Color(0xFF5473bb),
            textSubtle: Colors.grey,
            textSubtlest: Colors.grey[400]!,
            textDisabled: Colors.grey[600]!,
            bottomNavBorder: Colors.blueGrey,
          ),
        ],
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColorPalettes.white,
        extensions: <ThemeExtension<dynamic>>[
          AppColorExtension(
            primary: AppColorPalettes.white,
            secondary: AppColorPalettes.white500,
            text: AppColorPalettes.black500,
            textInverse: const Color(0xFF5473bb),
            textSubtle: Colors.grey,
            textSubtlest: Colors.grey[400]!,
            textDisabled: Colors.grey[200]!,
            bottomNavBorder: Colors.blueGrey,
          ),
          AppSpaceExtension.fromBaseSpace(8),
          AppTypographyExtension.fromColors(
            defaultFontColor: Colors.black,
            linkColor: Colors.blue,
            dimFontColor: Colors.grey,
          ),
        ],
      ),
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
      home: AuthControll(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthControll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Obx(() {
      if (authController.user.value != null) {
        final userId = authController.user.value!.uid;
        return CategoriesPage(
          userId: userId,
        );
      } else {
        return SignupPage();
      }
    });
  }
}
