import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/myfavorite_data.dart';
import 'package:my_project/data/model/myfavoritemodel.dart';

class MyFavoriteController extends GetxController {
  MyServices myServices = Get.find();
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;

  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delteData(String favoriteid) async {
    myFavoriteData.deleteData(favoriteid);

    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  
  
}
