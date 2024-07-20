//create read update delete

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/core/functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postdata(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = json.decode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }
}
