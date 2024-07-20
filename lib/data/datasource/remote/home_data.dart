import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData()async{
    var response= await crud.postdata(AppLink.home, {});
  return  response.fold((l) => l, (r) =>r);
  }
  getTopItems()async{
    var response= await crud.postdata(AppLink.topselling, {});
  return  response.fold((l) => l, (r) =>r);
  }
     searchItems(String search)async{
    var response= await crud.postdata(AppLink.search, {"search" :search});
  return  response.fold((l) => l, (r) =>r);
  }
}