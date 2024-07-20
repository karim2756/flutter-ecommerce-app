import 'package:get/get.dart';
import 'package:my_project/core/class/crud.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }
  
}