import 'package:get/get.dart';
import 'package:my_project/core/constant/pageroute.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController{
late String verificationCode;

  @override
  goToResetPassword() {
    Get.offAllNamed(AppRoutes.resetPassword);
  }

  @override
  checkCode() {}


}
