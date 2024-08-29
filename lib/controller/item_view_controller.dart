import 'package:admin_ecommerce/core/class/curd.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/data/item_data.dart';
import 'package:flutter/material.dart';

import '../core/model/items_model.dart';

abstract class ItemsViewController extends ChangeNotifier {
  view();
}

class ItemsViewControllerImp extends ItemsViewController {
  StatusRequest statusRequest = StatusRequest.nano;
  final ItemsData _itemsData = ItemsData(Curd());
  List<ItemsModel> itemModel = [];
  @override
  view() async {
    statusRequest = StatusRequest.loading;
    var request = await _itemsData.view();
    switch (request['status']) {
      case "success":
        for (var i in request['data']) {
          itemModel.add(ItemsModel.fromJson(i));
        }
        statusRequest = StatusRequest.success;
        break;
      default:
        statusRequest = StatusRequest.failure;
        break;
    }
    notifyListeners();
  }
}
