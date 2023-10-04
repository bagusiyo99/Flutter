import 'package:get/get.dart';

class BarangProvider extends GetConnect {
  Future<Response> menu() {
    var myheader = {
      'Accept': 'application/json', // Perbaiki ejaan 'application/json'
    };
    return get('http://192.168.1.8:8000/api/barang', headers: myheader);
  }
}
