import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/orders/pendingorders_data.dart';
import 'package:my_project/data/model/ordersmodel.dart';

class PendingOrdersController extends GetxController {
  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.find());

  MyServices myServices = Get.find();
  List data = [];
  late StatusRequest statusRequest;

  printPaymentMethod(val) {
    if (val == 0) {
      return "103".tr;
    } else {
      return "104".tr;
    }
  }

  printOrderStatus(val) {
    if (val == 0) {
      return "120".tr;
    } else if (val == 1) {
      return "121".tr;
    } else {
      return "122".tr;
    }
  }

  getOrders() async {
    statusRequest = StatusRequest.loading;
    var response = await pendingOrdersData
        .getPendingOrders(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
