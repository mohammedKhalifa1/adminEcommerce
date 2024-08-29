import 'dart:io';

import 'package:admin_ecommerce/core/class/link.dart';

import '../class/curd.dart';

class ItemsData {
  Curd curd;
  ItemsData(this.curd);
  view() async {
    var request = await curd.postData(AppLink.itemsView, {});
    return request;
  }

  add(String name, String itemCat, String price, String description,
      [File? file]) async {
    if (file != null) {
      var request = await curd.postRequestWithFile(
          AppLink.itemsAdd,
          {
            "name": name,
            "itemCat": itemCat,
            "price": price,
            "description": description,
          },
          file);
      return request;
    } else {
      var request = await curd.postData(
        AppLink.itemsAdd,
        {
          "name": name,
          "itemCat": itemCat,
          "price": price,
          "description": description,
        },
      );
      return request;
    }
  }

  delete(String fileNme, String itemsID) async {}
  edit() {}
}
