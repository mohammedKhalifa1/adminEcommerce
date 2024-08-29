import 'package:flutter/material.dart';

class CustomTextButtonWithOutColor extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  const CustomTextButtonWithOutColor({
    super.key,
    required this.onPressed,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(buttonName));
  }
}
