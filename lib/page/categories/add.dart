import 'package:admin_ecommerce/controller/categories_add_edit.dart';
import 'package:admin_ecommerce/core/class/class_app_name.dart';
import 'package:admin_ecommerce/core/widget/text_form.dart';
import 'package:flutter/material.dart';
import '../../core/widget/custom_button_with_out_color.dart';

class CatAdd extends StatelessWidget {
  const CatAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppName.catAddAppBar),
      ),
      body: const CatAddTextField(),
    );
  }
}

class CatAddTextField extends StatelessWidget {
  const CatAddTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    CatAddEditControllerImp catAddEditControllerImp = CatAddEditControllerImp();
    return Column(
      children: [
        TextFromSignUp(controller: controller, hintText: "Categories Name"),
        CustomTextButtonWithOutColor(
            onPressed: () {
              catAddEditControllerImp.add(controller.text, context);
            },
            buttonName: "Done"),
      ],
    );
  }
}
