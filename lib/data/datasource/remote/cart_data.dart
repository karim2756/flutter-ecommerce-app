import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class CartData{
  Crud crud;
  CartData(this.crud);
  cartAdd(String userId,String itemId)async{
    var response= await crud.postdata(AppLink.cartAdd, {"usersid":userId,"itemsid":itemId});
  return  response.fold((l) => l,(r) => r,);
  }
   cartDelete(String userId,String itemId)async{
    var response= await crud.postdata(AppLink.cartDelete, {"usersid":userId,"itemsid":itemId});
  return  response.fold((l) => l, (r) =>r);
  }
  cartItemCount(String userId,String itemId)async{
    var response= await crud.postdata(AppLink.cartItemCount, {"usersid":userId,"itemsid":itemId});
  return  response.fold((l) => l, (r) =>r);
  }
  cartView(String userId)async{
    var response= await crud.postdata(AppLink.cartView, {"usersid":userId});
  return  response.fold((l) => l,(r) => r,);
  }
    checkCoupon(String couponName)async{
    var response= await crud.postdata(AppLink.checkCoupon, {"couponname":couponName});
  return  response.fold((l) => l,(r) => r,);
  }
}
