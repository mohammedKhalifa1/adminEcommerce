import 'package:admin_ecommerce/core/class/curd.dart';
import 'package:admin_ecommerce/core/class/link.dart';

class CategoriesData {
  Curd curd;
  CategoriesData(this.curd);

  view() async {
    var request = await curd.postData(AppLink.categoriesView, {});
    return request;
  }

  add(String categoriesName) async {
    var request = await curd
        .postData(AppLink.categoriesAdd, {"CategoriesName": categoriesName});
    return request;
  }
}
