import 'package:admin_ecommerce/controller/login_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/widget/text_form.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController controllerPassword;
  late TextEditingController controllerName;
  @override
  void initState() {
    controllerPassword = TextEditingController();
    controllerName = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<HomePageController>(
            builder: (context, model, child) => Column(
              children: [
                TextFromSignUp(
                  controller: controllerName,
                  hintText: "userName",
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFromSignUp(
                  controller: controllerPassword,
                  hintText: "password",
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    model.login(
                        controllerName.text, controllerPassword.text, context);
                  },
                  child: const Text("login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
