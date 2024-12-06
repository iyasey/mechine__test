import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/app_theme.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_button.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;

    final typography = AppTheme.of(context).typography;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/448146415_957315676399164_4179835088892609477_n.jpg",
              width: spaces.space_800 * 3,
            ),
          ),
          SizedBox(height: spaces.space_400),
          const CustomTextField(
            label: "Email",
          ),
          SizedBox(
            height: spaces.space_400,
          ),
          const CustomTextField(
            label: "Password",
          ),
          TextButton(
            onPressed: () {},
            child: Text("Forgot password?", style: typography.h300),
          ),
          SizedBox(
            height: spaces.space_400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
            child: CustomButton(
              txt: "CONTINUE",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                  onPressed: () {},
                  child: Text("Register", style: typography.h300))
            ],
          )
        ],
      ),
    );
  }
}
