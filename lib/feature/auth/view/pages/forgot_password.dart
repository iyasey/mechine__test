import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/auth/controller/auth_controller.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_button.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_textfield.dart';

class ForgotPassword extends StatelessWidget {
  final authController = Get.find<AuthController>();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final emailController = TextEditingController();
    final colors = AppTheme.of(context).colors;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    weight: 30,
                    color: colors.text,
                  )),
              SizedBox(
                width: width * 0.1,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                    color: colors.text,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomTextField(controller: emailController, label: "Email"),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Enter the email address you used to create your account and",
              style: TextStyle(
                  color: colors.text,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            "we will send you a link to reset your password",
            style: TextStyle(
                color: colors.text, fontSize: 13, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: CustomButton(
              onPressed: () {
                final email = emailController.text.trim();
                if (email.isNotEmpty) {
                  authController.forgotPassword(email);
                } else {
                  Get.snackbar("Error", "Please enter a valid email.");
                }
              },
              txt: " CONTINUE",
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(
                    color: colors.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              Text("Register",
                  style: TextStyle(
                      color: colors.text,
                      fontSize: 13,
                      fontWeight: FontWeight.w500))
            ],
          )
        ],
      ),
    );
  }
}
