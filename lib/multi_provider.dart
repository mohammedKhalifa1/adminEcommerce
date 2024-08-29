import 'package:admin_ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/login_home_controller.dart';
import 'page/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return HControllerImp();
          },
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(),
        ),
      ],
      child: const Home(),
    );
  }
}
