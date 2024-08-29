import 'package:admin_ecommerce/core/class/curd.dart';
import 'package:admin_ecommerce/core/class/route_name.dart';
import 'package:admin_ecommerce/core/data/categories_data.dart';
import 'package:flutter/material.dart';

abstract class CatAddEditController extends ChangeNotifier {
  add(String categoriesName, BuildContext context);
}

class CatAddEditControllerImp extends CatAddEditController {
  final CategoriesData _categoriesData = CategoriesData(Curd());
  @override
  add(categoriesName, context) async {
    var request = await _categoriesData.add(categoriesName);
    if (request['status'] == 'success') {
      Navigator.of(context).popAndPushNamed(RouteName.catView);
    }
  }
}
