import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class PendingOrdersData{
  Crud crud;
  PendingOrdersData(this.crud);
  getPendingOrders(String usersId)async{
    var response= await crud.postdata(AppLink.pending, {"id":usersId});
  return  response.fold((l) => l, (r) =>r);
  }
}