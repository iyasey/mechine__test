import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/auth/controller/auth_controller.dart';
import 'package:mechine___test/feature/auth/view/pages/login_page.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_button.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_textfield.dart';

class SignupPage extends StatelessWidget {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final authController = Get.find<AuthController>();

  void onSignUpButtonClicked() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final name = nameController.text.trim();
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    authController.signUp(email: email, name: name, password: password);
  }

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.22,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: colors.text,
                      weight: 30,
                    )),
                SizedBox(
                  width: width * 0.1,
                ),
                Text(
                  "Create an Account",
                  style: TextStyle(
                      color: colors.text,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(controller: nameController, label: "Full Name"),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(controller: emailController, label: "Email"),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(controller: passwordController, label: "Password"),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
                controller: confirmPasswordController,
                label: "Confirm Password"),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: CustomButton(
                onPressed: onSignUpButtonClicked,
                txt: "CONTINUE",
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: colors.text),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(LoginPage());
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: colors.text),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
