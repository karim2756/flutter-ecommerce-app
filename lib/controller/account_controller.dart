import 'package:get/get.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/services/services.dart';

class AccountController extends GetxController {
  MyServices myServices = Get.find();
  String? username;
  initialData() {
    username = myServices.sharedPreferences.getString("username");
  }

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.language);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
