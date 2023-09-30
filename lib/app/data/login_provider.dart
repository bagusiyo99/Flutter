import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> auth(var data) {
    var myheader = {
      'Accept': 'apllication/json',
    };
    return post('http://192.168.1.8:8000/api/login', data, headers: myheader);
  }
}
