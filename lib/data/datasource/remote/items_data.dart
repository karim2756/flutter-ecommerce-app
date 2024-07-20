import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class ItemsData{
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid)async{
    var response= await crud.postdata(AppLink.items, {'id': id.toString(),"usersid" :userid});
  return  response.fold((l) => l, (r) =>r);
  }

}