import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gudang/app/data/login_provider.dart';

class LoginController extends GetxController {
  final TextEditingController textEmail = TextEditingController();
  final TextEditingController textPassword = TextEditingController();

  void auth() {
    // print(textEmail.text);
    String email = textEmail.text;
    String password = textPassword.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error", "Email dan Password tidak boleh kosong",
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
          Get.snackbar(
            "Success", "Login Berhasil",
            backgroundColor: Colors.green, //warna body
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
