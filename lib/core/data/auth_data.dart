import 'package:admin_ecommerce/core/class/curd.dart';
import 'package:admin_ecommerce/core/class/link.dart';

class AuthData {
  Curd curd;
  AuthData(this.curd);
  check(String adminPassword, String adminName) async {
    var request = await curd.postData(AppLink.login, {
      "adminName": adminName,
      "adminPassword": adminPassword,
    });
    return request;
  }
}
