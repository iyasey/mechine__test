import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/core/theme/theme_provider.dart';
import 'package:mechine___test/feature/auth/view/pages/forgot_password.dart';
import 'package:mechine___test/feature/auth/view/pages/login_page.dart';
import 'package:mechine___test/feature/auth/view/pages/signup_page.dart';
import 'package:mechine___test/feature/categories/view/pages/categories_page.dart';
import 'package:mechine___test/feature/categories/view/pages/settings_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ref.watch(themeProvider),
      home: CategoriesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
