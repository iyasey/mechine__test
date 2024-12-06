import 'package:flutter/material.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_button.dart';
import 'package:mechine___test/feature/auth/view/widgets/custom_textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
          const CustomTextField(label: "Full Name"),
          SizedBox(
            height: height * 0.01,
          ),
          const CustomTextField(label: "Email"),
          SizedBox(
            height: height * 0.01,
          ),
          const CustomTextField(label: "Password"),
          SizedBox(
            height: height * 0.01,
          ),
          const CustomTextField(label: "Confirm Password"),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: CustomButton(
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
