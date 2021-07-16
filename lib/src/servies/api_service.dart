import 'dart:convert';

import 'package:auth/src/utils/constant.dart';
import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

// import 'package:dio/dio.dart';
class ApiService{
  var dio =  Dio();
  post(_url,data)async {
    // try{
    //   var response = await http.post(Uri.parse('${MyConstant.localBaseURL}$_url'));
    //   if(response.statusCode == 200){
    //     return jsonDecode(response.body);
    //   }else{
    //     return Future.error("Servier error !");
    //   }
    // }catch(SocketException){
    //   return Future.error("Error fetching data !");
    // }

    Response apiData = await dio.post('${MyConstant.localBaseURL}$_url',data: data);
    print(apiData.data);
    return apiData.data;
  }
}