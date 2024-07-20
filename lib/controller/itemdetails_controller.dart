import 'package:get/get.dart';
import 'package:my_project/controller/cart_controller.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/model/itemsmodel.dart';



class ItemDetailsControllerImp extends GetxController {
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  MyServices myServices =Get.find();
  String? lang ;
  // ignore: prefer_typing_uninitialized_variables
  var itemCount;

  CartController cartController = Get.put(CartController());
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];

    itemCount =
        await cartController.getItemCount(itemsModel.itemsId.toString());
        statusRequest=StatusRequest.success;
    update();
  }

  add() {
    cartController.add(itemsModel.itemsId.toString());
    itemCount++;
    update();
  }

  remove() {
    if (itemCount != 0) {
      cartController.delete(itemsModel.itemsId.toString());
      itemCount--;
      update();
    }
  }

  @override
  void onInit() {
   lang =myServices.sharedPreferences.getString("lang");
    initialData();
    super.onInit();
  }
}
