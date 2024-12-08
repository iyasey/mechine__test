import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/auth/controller/auth_controller.dart';
import 'package:mechine___test/feature/auth/view/pages/forgot_password.dart';
import 'package:mechine___test/feature/auth/view/pages/signup_page.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_button.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = Get.find<AuthController>();

  void onSignInButtonClicked() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    authController.signIn(email, password);
  }

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/448146415_957315676399164_4179835088892609477_n.jpg",
              width: width * 0.7,
            ),
          ),
          SizedBox(height: height * 0.04),
          CustomTextField(
            controller: emailController,
            label: "Email",
          ),
          SizedBox(
            height: height * 0.03,
          ),
          CustomTextField(
            controller: passwordController,
            label: "Password",
          ),
          TextButton(
            onPressed: () {
              Get.to(ForgotPassword());
            },
            child: Text("Forgot password?",
                style: typography.h300.copyWith(color: colors.text)),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
            child: CustomButton(
              onPressed: onSignInButtonClicked,
              txt: "CONTINUE",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                  onPressed: () {
                    Get.to(SignupPage());
                  },
                  child: Text("Register", style: typography.h300))
            ],
          )
        ],
      ),
    );
  }
}
