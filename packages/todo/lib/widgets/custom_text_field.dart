import 'package:flutter/material.dart';

class CustomInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLine;
  final FormFieldValidator<String>? validator;
  final String label;
  final TextStyle style;

  CustomInputTextField({required this.controller,
    this.maxLine, this.validator,
    required this.label, required this.style});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLine,
      validator: validator,
      style:style,
      decoration: InputDecoration(
        hintText: label,
        border: InputBorder.none,
      ),
    );
  }
}
