import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "41".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "42".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "43".tr;
    }

  }
      if (val.isEmpty) {
      return "44".tr;
    }
    if (val.length < min) {
      return "${"45".tr} $min";
    }
    if (val.length > max) {
      return "${"46".tr} $max";
    }
}
