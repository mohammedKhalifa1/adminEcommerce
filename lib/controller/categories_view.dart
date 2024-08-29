import 'package:admin_ecommerce/core/model/categories_model.dart';
import 'package:flutter/material.dart';
import '../core/class/curd.dart';
import '../core/class/status_request.dart';
import '../core/data/categories_data.dart';

abstract class CatViewController extends ChangeNotifier {
  view();
}

class CatViewControllerImp extends CatViewController {
  List data = [];
  CategoriesData categoriesData = CategoriesData(Curd());
  StatusRequest statusRequest = StatusRequest.nano;
  List<CategoriesModel> catModel = [];
  @override
  view() async {
    statusRequest = StatusRequest.loading;
    var request = await categoriesData.view();
    if (request['status'] == 'success') {
      for (var item in request['data']) {
        catModel.add(CategoriesModel.fromJson(item));
      }
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    notifyListeners();
  }
}
