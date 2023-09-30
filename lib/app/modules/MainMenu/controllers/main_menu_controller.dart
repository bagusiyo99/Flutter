import 'package:get/get.dart';
import 'package:gudang/app/data/menu_provider.dart';

class MainMenuController extends GetxController {
  RxDouble totalHargaKeseluruhan = 0.0.obs;

  // ignore: annotate_overrides
  void onInit() {
    super.onInit();
    fetchDataAndCalculateTotal(); // Panggil metode ini saat controller diinisialisasi
  }

  void fetchDataAndCalculateTotal() async {
    final response = await MenuProvider().menu();
    if (response.status.isOk) {
      final data = response.body;
      double total = 0;

      if (data != null && data.isNotEmpty) {
        for (var item in data) {
          final totalHargaRaw = item['total_harga'];
          if (totalHargaRaw is String) {
            final totalHarga = double.tryParse(totalHargaRaw) ?? 0.0;
            total += totalHarga;
          } else if (totalHargaRaw is int) {
            final totalHarga = totalHargaRaw.toDouble();
            total += totalHarga;
          }
        }
      } else {
        // Tidak ada data yang ditemukan, tambahkan penanganan kesalahan di sini
        print('Data kosong');
      }

      totalHargaKeseluruhan.value = total;
    } else {
      // Handle error jika ada
      print('Terjadi kesalahan saat mengambil data dari API');
    }
  }
}
