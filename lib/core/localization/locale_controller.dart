import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constant/apptheme.dart';
import 'package:my_project/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeData? appTheme =themeEnglish;

  MyServices myServices = Get.find();
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    appTheme= langCode=="ar"? themeArabic : themeEnglish;
    Get.changeTheme(appTheme!);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);

  }

  @override
  void onInit() {
    String? sharedPrefeLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefeLang == "ar") {
      language = const Locale("ar");
      appTheme=themeArabic;
      update();
    } else  {
      language = const Locale("en");
      update();
    }
      super.onInit();
  }
}
