import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mechine___test/core/theme/theme_provider.dart';
import 'package:mechine___test/feature/auth/controller/auth_controller.dart';
import 'package:mechine___test/feature/auth/view/pages/login_page.dart';
import 'package:mechine___test/feature/auth/view/pages/signup_page.dart';
import 'package:mechine___test/feature/categories/view/pages/categories_page.dart';
import 'package:mechine___test/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ref.watch(themeProvider),
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
        return CategoriesPage(userId: userId,); 
      } else {
        return SignupPage(); 
      }
    });
  }
}