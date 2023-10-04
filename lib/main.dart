import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gudang/app/modules/MainMenu/controllers/main_menu_controller.dart';
import 'package:sp_util/sp_util.dart';
import 'app/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import initializeDateFormatting

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();

  // Daftarkan MainMenuController
  Get.put(MainMenuController());

  // Inisialisasi pengaturan untuk pemformatan tanggal dalam bahasa Indonesia
  await initializeDateFormatting('id_ID', null); // Tambahkan await di sini

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    ),
  ); // Tutup tanda kurung runApp
} // Tutup tanda kurung main
