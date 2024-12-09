import 'package:flutter/material.dart';
import 'package:mechine___test/core/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CustomTextField(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0),
        child: TextFormField(
          style: const TextStyle(color: Colors.grey),
          controller: controller,
          decoration: InputDecoration(
              label: Text(
                label,
                style: const TextStyle(color: Colors.grey),
              ),
              filled: true,
              fillColor: colors.secondary,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
