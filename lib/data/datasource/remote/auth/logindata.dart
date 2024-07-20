import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(
    String email,
    String password,
  ) async {
    var response = await crud.postdata(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
