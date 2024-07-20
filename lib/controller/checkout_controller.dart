import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/address_data.dart';
import 'package:my_project/data/datasource/remote/checkout_data.dart';
import 'package:my_project/data/model/addressmodel.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  bool? successCheckout;
  String? paymentMethod;
  String? addressid;
  late String couponId;
  late String discountCoupon;
  late String totalprice;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkOut() async {
    statusRequest = StatusRequest.loading;

    if (paymentMethod == null) {
      Get.snackbar("118".tr, "119".tr,
          colorText: AppColor.backgroundColor,
          backgroundColor: AppColor.primaryColor);
    }

    if (addressid == null) {
      Get.snackbar("118".tr, "105".tr,
          colorText: AppColor.backgroundColor,
          backgroundColor: AppColor.primaryColor);
    }
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid,
      "pricedelivery": "55",
      "ordersprice": totalprice,
      "couponid": couponId,
      "coupondiscount": discountCoupon,
      "paymentmethod": paymentMethod
    };
    var response = await checkOutData.checkOut(data);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        successCheckout = true;
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("116".tr, "117".tr);
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    successCheckout;
    couponId = Get.arguments['couponid'];
    totalprice = Get.arguments['totalprice'];
    discountCoupon = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
