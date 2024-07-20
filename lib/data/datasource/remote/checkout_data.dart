import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);
  checkOut(Map data) async {
    var response = await crud.postdata(AppLink.checkOut, data);
    return response.fold((l) => l, (r) => r);
  }
}
