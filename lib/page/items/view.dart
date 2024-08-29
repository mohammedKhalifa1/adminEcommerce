import 'package:admin_ecommerce/controller/item_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/items/view.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemsViewControllerImp(),
      child: const ItemsViewWidget(),
    );
  }
}
