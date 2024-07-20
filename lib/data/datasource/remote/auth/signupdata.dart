import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(
      String username, String password, String email, String phone) async {
    var response = await crud.postdata(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
