import 'package:get/get.dart';
import 'package:gudang/app/routes/app_pages.dart';

class HomeController extends GetxController {
  // ignore: non_constant_identifier_names
  void OnTapLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}
