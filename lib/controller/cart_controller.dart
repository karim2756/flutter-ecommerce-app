import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/cart_data.dart';
import 'package:my_project/data/model/cartmodel.dart';
import 'package:my_project/data/model/couponmodel.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  int totalPrice = 0;
  TextEditingController? couponController;
  CouponModel? couponModel;
  int? couponValue = 0;
  String? couponName;
  String? couponId;
  late StatusRequest statusRequest;

  goToCheckOut() {
    if (data.isEmpty) {
      Get.snackbar(
        "118".tr,
        "125".tr,
        colorText: AppColor.backgroundColor,
        backgroundColor: AppColor.primaryColor.withOpacity(.4),
      );
    } else {
      Get.toNamed(AppRoutes.checkOut, arguments: {
        "couponid": couponId ?? "0",
        "totalprice": totalPrice.toString(),
        "discountcoupon": couponValue.toString(),
      });
    }
  }

  add(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.cartAdd(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        Get.rawSnackbar(
            messageText: Text(
              "126".tr,
              style: const TextStyle(
                  color: AppColor.backgroundColor, fontSize: 15),
            ),
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  delete(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.cartDelete(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        Get.rawSnackbar(
            messageText: Text(
              "127".tr,
              style: const TextStyle(
                  color: AppColor.backgroundColor, fontSize: 15),
            ),
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  getItemCount(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.cartItemCount(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        // ignore: prefer_typing_uninitialized_variables
        var itemCount;
        itemCount = response['data'];

        return itemCount;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  cartView() async {
    statusRequest = StatusRequest.loading;
    var response =
        await cartData.cartView(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        if (response['datacart']['status'] == "success") {
          List responseData = response['datacart']['data'];
          Map responseDataCountPrice = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalPrice = int.parse(responseDataCountPrice['totalprice']);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  coupon() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.checkCoupon(couponController!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        Map<String, dynamic> couponData = response['data'];
        couponModel = CouponModel.fromJson(couponData);
        couponValue = couponModel!.couponDiscount;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      } else {
        couponValue = 0;
        couponName = null;
        couponId = null;
      }
    }
    update();
  }

  refreshPage() {
    totalPrice = 0;
    data.clear();
    cartView();
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    cartView();
    super.onInit();
  }
}
