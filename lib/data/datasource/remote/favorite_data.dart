import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class FavoriteData{
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String userId,String itemId)async{
    var response= await crud.postdata(AppLink.addFavorite, {"usersid":userId,"itemsid":itemId.toString()});
  return   response.fold((l) => l,(r) => r,);
  }
   removeFavorite(String userId,String itemId)async{
    var response= await crud.postdata(AppLink.removeFavorite, {"usersid":userId,"itemsid":itemId});
  return  response.fold((l) => l, (r) =>r);
  }
}