import 'package:auth/src/utils/constant.dart';
import 'package:dio/dio.dart';
class ApiService{
  var dio =  Dio();
  post(_url,data)async {
    Response apiData = await dio.post('${MyConstant.localBaseURL}$_url',data: data);
    return apiData.data;
  }
}           