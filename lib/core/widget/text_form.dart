import 'package:flutter/material.dart';

class TextFromSignUp extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TextFromSignUp(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
