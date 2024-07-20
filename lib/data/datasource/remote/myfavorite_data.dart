import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class MyFavoriteData{
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id)async{
    var response= await crud.postdata(AppLink.viewFavorite, {"id":id});
  return  response.fold((l) => l, (r) =>r);
  }
   deleteData(String id)async{
    var response= await crud.postdata(AppLink.deleteFromFavorite, {"id":id});
  return  response.fold((l) => l, (r) =>r);
  }
}