import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/items_data.dart';
import 'package:my_project/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCategory(val);
  getItems(String categoryId);
  goToItemssDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices =Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  List categories = [];
  String? catId;
  int? selectedCat;
  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catId = Get.arguments['catId'];
    getItems(catId!);
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  changeCategory(val) {
    selectedCat = val;
    // to change item category and view specific items
    getItems(val.toString());
    update();
  }

  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryId,myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  goToItemssDetails(itemsModel) {
   Get.toNamed(AppRoutes.productsDetails,arguments: {"itemsmodel":itemsModel});
  }
}
