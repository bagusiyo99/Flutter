import 'package:get/get.dart';

class PelangganProvider extends GetConnect {
  Future<Response> menu() {
    var myheader = {
      'Accept': 'application/json',
    };
    return get('http://192.168.1.8:8000/api/pelanggan', headers: myheader);
  }
}
