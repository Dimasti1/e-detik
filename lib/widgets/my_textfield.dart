import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hinText;
  final bool obsecureText;
  final TextEditingController controller;

  const MyTextfield(
      {super.key,
      required this.hinText,
      required this.obsecureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hinText,
      ),
      obscureText: obsecureText,
    );
  }
}
