import 'package:admin_ecommerce/controller/item_add_controller.dart';
import 'package:admin_ecommerce/core/widget/custom_button_with_out_color.dart';
import 'package:admin_ecommerce/core/widget/custom_drop_down_list_package.dart';
import 'package:admin_ecommerce/core/widget/text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItemsWidget extends StatefulWidget {
  const AddItemsWidget({super.key});

  @override
  State<AddItemsWidget> createState() => _AddItemsWidgetState();
}

class _AddItemsWidgetState extends State<AddItemsWidget> {
  @override
  void initState() {
    context.read<ItemsAddControllerImp>().getCategories();
    context.read<ItemsAddControllerImp>().catId = TextEditingController();
    context.read<ItemsAddControllerImp>().catName = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsAddControllerImp>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFromSignUp(controller: value.itemName, hintText: "name"),
              const SizedBox(
                height: 10,
              ),
              TextFromSignUp(controller: value.itemPrice, hintText: "price"),
              const SizedBox(
                height: 10,
              ),
              TextFromSignUp(
                  controller: value.itemDescription, hintText: "description"),
              const SizedBox(
                height: 10,
              ),
              CustomTextButtonWithOutColor(
                  onPressed: () {
                    value.choseImage();
                  },
                  buttonName: "Chose image"),
              value.file != null
                  ? Container(
                      height: 100,
                      child: Image.file(
                        value.file!,
                        fit: BoxFit.fill,
                      ))
                  : const SizedBox(),
              CustomDropDownList(
                  title: "Categories",
                  listData: value.listCategories,
                  controllerName: value.catName,
                  controllerValue: value.catId),
              CustomTextButtonWithOutColor(
                  onPressed: () {
                    value.addItems(context);
                  },
                  buttonName: "add")
            ],
          ),
        ),
      ),
    );
  }
}
