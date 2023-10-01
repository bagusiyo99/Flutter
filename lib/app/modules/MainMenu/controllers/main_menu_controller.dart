import 'package:get/get.dart';
import 'package:gudang/app/data/menu_provider.dart';

class MainMenuController extends GetxController {
  RxDouble totalHargaKeseluruhan = 0.0.obs;
  RxList<dynamic> data = <dynamic>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchDataAndCalculateTotal();
  }

  void fetchDataAndCalculateTotal() async {
    try {
      final response = await MenuProvider().menu();

      if (response.status.isOk) {
        final responseData = response.body;

        if (responseData != null && responseData.isNotEmpty) {
          double total = 0;

          for (var item in responseData) {
            final totalHargaRaw = item['total_harga'];

            if (totalHargaRaw is String) {
              final totalHarga = double.tryParse(totalHargaRaw) ?? 0.0;
              total += totalHarga;
            } else if (totalHargaRaw is int) {
              final totalHarga = totalHargaRaw.toDouble();
              total += totalHarga;
            }
          }

          // Bersihkan data sebelum mengisinya dengan data baru
          data.clear();
          // Tambahkan data baru dari API
          data.addAll(responseData);
          // Perbarui total harga keseluruhan
          totalHargaKeseluruhan.value = total;
        } else {
          print('Data kosong');
        }
      } else {
        print('Terjadi kesalahan saat mengambil data dari API');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}
