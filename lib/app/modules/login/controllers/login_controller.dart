import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gudang/app/data/login_provider.dart';
import 'package:gudang/app/modules/MainMenu/controllers/main_menu_controller.dart';
import 'package:sp_util/sp_util.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController textEmail = TextEditingController();
  final TextEditingController textPassword = TextEditingController();

  void auth() {
    String email = textEmail.text;
    String password = textPassword.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email dan Password tidak boleh kosong",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      EasyLoading.show();

      var data = {
        "email": email,
        "password": password,
      };

      LoginProvider().auth(data).then((value) {
        if (value.statusCode == 200) {
          var responseBody = value.body;
          var user = responseBody['user'];
          SpUtil.putString('name', user['name']);
          SpUtil.putString('email', user['email']);
          SpUtil.putString('id', user['id'].toString());

          // Setelah login berhasil, panggil fetchDataAndCalculateTotal() dari MainMenuController
          MainMenuController mainMenuController = Get.find();
          mainMenuController.fetchDataAndCalculateTotal();

          Get.offAllNamed(Routes.MAIN_MENU);

          Get.snackbar(
            "Success",
            "Login Berhasil",
            backgroundColor: Color.fromARGB(255, 8, 59, 244),
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            "Email dan Password Salah",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
        EasyLoading.dismiss();
      });
    }
  }
}
