import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/orders/details_data.dart';
import 'package:my_project/data/model/cartmodel.dart';
import 'package:my_project/data/model/ordersmodel.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData
        .getOrdersDetails(ordersModel.ordersId.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteOrder() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.deleteOrder(ordersModel.ordersId.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar("48".tr, "130".tr,
            colorText: AppColor.backgroundColor,
            backgroundColor: AppColor.primaryColor);
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
    getData();

    super.onInit();
  }
}
