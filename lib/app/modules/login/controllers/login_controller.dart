import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gudang/app/data/login_provider.dart';
import 'package:sp_util/sp_util.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController textEmail = TextEditingController();
  final TextEditingController textPassword = TextEditingController();

  void auth() {
    // print(textEmail.text);
    String email = textEmail.text;
    String password = textPassword.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error", "Email dan Password tidak boleh kosong k",
        backgroundColor: Colors.red, //warna body
        colorText: Colors.white,
      );
    } else {
      EasyLoading.show(); // loading awal
      var data = {
        "email": email,
        "password": password,
      };
      LoginProvider().auth(data).then((value) {
        if (value.statusCode == 200) {
          var responseBody = value.body;
          var user = responseBody['user'];
          // ignore: unused_local_variable
          // var name = user['name'];
          // var token = user['token'];
          // print(token);
          SpUtil.putString('name', user['name']);
          SpUtil.putString('email', user['email']);
          SpUtil.putString('id', user['id'].toString());
          Get.offAllNamed(Routes.MAIN_MENU);

          Get.snackbar(
            "Success", "Login Berhasil",
            backgroundColor: Color.fromARGB(255, 8, 59, 244), //warna body
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error", "Email dan Password Salah woy",
            backgroundColor: Colors.red, //warna body
            colorText: Colors.white,
          );
        }
        EasyLoading.dismiss(); //loading akhir
      });
    }
  }
}
