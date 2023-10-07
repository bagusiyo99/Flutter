import 'package:get/get.dart';

class MenuProvider extends GetConnect {
  Future<Response> menu() {
    var myheader = {
      'Accept': 'application/json',
    };
    return get('http://192.168.1.8:8000/api/rekap-barang', headers: myheader);
  }
}
