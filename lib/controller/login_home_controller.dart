import 'package:admin_ecommerce/core/class/curd.dart';
import 'package:admin_ecommerce/core/class/route_name.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/data/auth_data.dart';
import 'package:flutter/material.dart';

import '../core/class/class_val.dart';

abstract class HomePage with ChangeNotifier {
  login(String adminPassword, String adminName, context);
}

class HomePageController extends HomePage {
  List<Chose> chose = [
    Chose("Categories", () {}),
    Chose("items", () {}),
    Chose("orders", () {}),
  ];

  AuthData authData = AuthData(Curd());
  StatusRequest statusRequest = StatusRequest.nano;

  @override
  login(adminPassword, adminName, context) async {
    var request = await authData.check(adminName, adminPassword);
    if (request['status'] == 'success') {
      statusRequest = StatusRequest.success;
      Navigator.of(context).pushNamed(RouteName.homeAdmin);
    } else {
      statusRequest = StatusRequest.failure;
    }
    notifyListeners();
  }
}
