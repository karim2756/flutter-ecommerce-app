import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class OrdersArchiveData{
  Crud crud;
  OrdersArchiveData(this.crud);
  getOrdersArchive(String usersId)async{
    var response= await crud.postdata(AppLink.archive, {"id":usersId});
  return  response.fold((l) => l, (r) =>r);
  }
   
}