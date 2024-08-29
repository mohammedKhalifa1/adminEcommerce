import 'package:flutter/material.dart';

abstract class HomeController with ChangeNotifier {}

class HControllerImp extends HomeController {
  test() {
    notifyListeners();
  }
}
