import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


post() async{
  var url = Uri.parse('https://www.testjsonapi.com/users/');
  http.Response response = await http.get(url);

  print(response.body);
}
