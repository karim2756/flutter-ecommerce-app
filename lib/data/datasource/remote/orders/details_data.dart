import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class OrdersDetailsData{
  Crud crud;
  OrdersDetailsData(this.crud);
  getOrdersDetails(String orderId)async{
    var response= await crud.postdata(AppLink.ordersDetails, {"id":orderId});
  return  response.fold((l) => l, (r) =>r);
  }
    deleteOrder(String orderId)async{
    var response= await crud.postdata(AppLink.delete, {"id":orderId});
  return  response.fold((l) => l, (r) =>r);
  }
}