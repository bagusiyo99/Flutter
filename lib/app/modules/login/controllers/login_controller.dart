import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController textEmail = TextEditingController();
  final TextEditingController textPassword = TextEditingController();

  void auth() {
    // print(textEmail.text);
    // ignore: unused_local_variable
    String email = textEmail.text;
    // ignore: unused_local_variable
    String password = textEmail.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error", "Email dan Password Salah",
        backgroundColor: Colors.red, //warna body
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Success", "Login Berhasil",
        backgroundColor: Colors.green, //warna body
        colorText: Colors.white,
      );
    }
  }
}
