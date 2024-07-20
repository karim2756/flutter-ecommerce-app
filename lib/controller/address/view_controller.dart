import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/address_data.dart';
import 'package:my_project/data/model/addressmodel.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  MyServices myServices = Get.find();
  String? usersid;
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String addressId) {
    addressData.deleteData(addressId);
    data.removeWhere((element) => element.addressId.toString() == addressId);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
