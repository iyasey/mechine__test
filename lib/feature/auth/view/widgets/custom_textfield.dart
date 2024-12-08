import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CustomTextField({super.key, required this.label,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0),
        child: TextFormField(controller: controller,
          decoration: InputDecoration(
              label: Text(
                label,
                style: TextStyle(color: Colors.grey),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
