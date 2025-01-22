
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  TextEditingController controller;
  String errort;
  String label;
  bool obscureText;
   String textError;
  InputField({
    required this.obscureText,
    required this.label,
    required this.controller,
    required this.errort,
    required this.textError,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        errorText: errort.isNotEmpty ? errort : null,
      ),
    );
  }
}