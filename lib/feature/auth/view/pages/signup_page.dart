import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mechine___test/feature/auth/controller/auth_controller.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    weight: 30,
                  )),
              SizedBox(
                width: width * 0.1,
              ),
              const Text(
                "Create an Account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              controller: confirmPasswordController, label: "Confirm Password"),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? "),
              Text(
                "Login",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
