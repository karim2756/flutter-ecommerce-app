import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/home_data.dart';
import 'package:my_project/data/model/itemsmodel.dart';

abstract class HomeController extends GetxController {
  initaildata();
  getData();
  goToItems(List categories, int selectedCat, String categoryId);
  goToItemssDetails(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  TextEditingController? search;
  List categories = [];
   List topCategoriesItems = [];
  List items = [];
    List topItems = [];
  List<ItemsModel> listSearchData = [];
  bool isSearch = false;
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  String? username;
  String? email;
  String? id;
  String? phone;
  String? lang;
  @override
  initaildata() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    lang = myServices.sharedPreferences.getString("lang");
    id = myServices.sharedPreferences.getString("id");
    phone = myServices.sharedPreferences.getString("phone");
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      statusRequest=StatusRequest.none;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    searchData();
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
   getTopSelling() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getTopItems();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        topCategoriesItems.addAll(response['categories']['data']);
        topItems.addAll(response['items']['data']);
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchItems(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        listSearchData.clear();
        List responseData = response['data'];
        listSearchData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catId": categoryId
    });
  }
  @override
  goToItemssDetails(itemsModel) {
   Get.toNamed(AppRoutes.productsDetails,arguments: {"itemsmodel":itemsModel});
  }
  @override
  void onInit() {
    search = TextEditingController();
    initaildata();
    getData();
    getTopSelling();
    super.onInit();
  }
}
