import 'package:get/get.dart';
import 'package:my_project/core/services/services.dart';

translateDatabase(columnEnglish,columnArabic){
  MyServices myServices =Get.find();
if(myServices.sharedPreferences.getString("lang")=="ar"){
  return columnArabic;
}else{
return columnEnglish;
}
}