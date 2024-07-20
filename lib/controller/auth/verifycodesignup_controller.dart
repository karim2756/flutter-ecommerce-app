import 'package:get/get.dart';
import 'package:my_project/core/constant/pageroute.dart';

abstract class VerifyCodeControllerSignUp extends GetxController {
  checkCode();
 goToSuccessSignUp();
}

class VerifyCodeControllerSignUpImp extends VerifyCodeControllerSignUp{
late String verificationCode;

  @override
  goToSuccessSignUp() {
    Get.offAllNamed(AppRoutes.successSignUp);
  }

  @override
  checkCode() {}


}
