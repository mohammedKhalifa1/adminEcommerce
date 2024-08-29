import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/categories_view.dart';
import '../widget/categories/view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CatViewControllerImp>(
      create: (context) => CatViewControllerImp(),
      child: const CatViewWidget(),
    );
  }
}
