import 'dart:io';

import 'package:admin_ecommerce/core/class/curd.dart';
import 'package:admin_ecommerce/core/class/route_name.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/data/categories_data.dart';
import 'package:admin_ecommerce/core/data/item_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import '../core/function/chose_image.dart';
import '../core/model/categories_model.dart';

abstract class ItemsAddController extends ChangeNotifier {
  getCategories();
  addItems(BuildContext context);
  choseImage();
  deleteItem();
}

class ItemsAddControllerImp extends ItemsAddController {
  File? file;
  final CategoriesData _categoriesData = CategoriesData(Curd());
  final ItemsData _itemsData = ItemsData(Curd());
  StatusRequest statusRequest = StatusRequest.nano;
  List<CategoriesModel> listCat = [];
  List<SelectedListItem> listCategories = [];
  late TextEditingController catName;
  late TextEditingController catId;
  TextEditingController itemName = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  TextEditingController itemDescription = TextEditingController();
  @override
  choseImage() async {
    file = await choseFile();
    notifyListeners();
  }

  @override
  getCategories() async {
    statusRequest = StatusRequest.loading;
    var request = await _categoriesData.view();
    if (request['status'] == 'success') {
      for (var element in request['data']) {
        listCat.add(CategoriesModel.fromJson(element));
      }
      for (var i = 0; i < listCat.length; i++) {
        listCategories.add(
          SelectedListItem(
            name: listCat[i].categoriesName!,
            value: listCat[i].categoriesId.toString(),
          ),
        );
      }
      statusRequest = StatusRequest.success;
    }
    notifyListeners();
  }

  @override
  addItems(context) async {
    statusRequest = StatusRequest.loading;
    var request = await _itemsData.add(
        itemName.text, catId.text, itemPrice.text, itemDescription.text, file);
    if (request['status'] == 'success') {
      // ignore: use_build_context_synchronously
      Navigator.of(context).popAndPushNamed(RouteName.itemView);
    }
  }

  @override
  deleteItem() {}
}



        //    listCategories = [
        //   SelectedListItem(
        //       name: element['categories_name'], value: element['categories_id'])
        // ];