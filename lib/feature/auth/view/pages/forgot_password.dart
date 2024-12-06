import 'package:flutter/material.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_button.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_textfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                "Forgot Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomTextField(label: "Email"),
          SizedBox(
            height: height * 0.01,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Enter the email address you used to create your account and",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ),
          const Text(
            "we will send you a link to reset your password",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: CustomButton(
              txt: " CONTINUE",
           
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              Text("Register",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500))
            ],
          )
        ],
      ),
    );
  }
}
