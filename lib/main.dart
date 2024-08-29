import 'package:admin_ecommerce/core/class/route.dart';
import 'package:admin_ecommerce/multi_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const App(), // //TestApp()
      routes: routes,
    );
  }
}
