import 'package:admin_ecommerce/core/class/route_name.dart';
import 'package:admin_ecommerce/page/categories/add.dart';
import 'package:admin_ecommerce/page/categories/view.dart';
import 'package:admin_ecommerce/page/items/view.dart';
import 'package:admin_ecommerce/page/items/add.dart';
import 'package:flutter/material.dart';

import '../../page/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  RouteName.homeAdmin: (context) => const HomeAdmin(),
  RouteName.catView: (context) => const CategoriesView(),
  RouteName.catAdd: (context) => const CatAdd(),
  RouteName.itemView: (context) => const ItemsView(),
  RouteName.itemAdd: (context) => const AddItems(),
};
