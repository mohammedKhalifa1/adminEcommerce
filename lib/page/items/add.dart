import 'package:admin_ecommerce/controller/item_add_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/items/add.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemsAddControllerImp(),
      child: const AddItemsWidget(),
    );
  }
}


  // CustomDropDownList(
  //           title: "Chose",
  //           listData: [
  //             SelectedListItem(name: "name", value: "test"),
  //             SelectedListItem(name: "name1", value: "test1"),
  //             SelectedListItem(name: "name2", value: "test2"),
  //             SelectedListItem(name: "name3", value: "test3"),
  //           ],
  //           controllerName: controllerName,
  //           controllerValue: controllerValue)