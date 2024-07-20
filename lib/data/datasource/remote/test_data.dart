import 'package:my_project/applink.dart';
import 'package:my_project/core/class/crud.dart';

class TestData{
  Crud crud;
  TestData(this.crud);
  getData()async{
    var response= await crud.postdata(AppLink.test, {});
  return  response.fold((l) => l, (r) =>r);
  }
}