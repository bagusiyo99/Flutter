import 'package:get/get.dart';
import 'package:gudang/app/data/pelanggan_provider.dart';

class PelangganController extends GetxController {
  final PelangganProvider pelangganProvider =
      PelangganProvider(); // Buat instansi dari provider

  RxList pelangganList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Panggil fetchData saat controller diinisialisasi
  }

  void fetchData() async {
    try {
      final response =
          await pelangganProvider.menu(); // Panggil metode menu() dari provider
      if (response.status.isOk) {
        final List responseData = response.body; // Ambil data dari respons
        pelangganList
            .assignAll(responseData); // Tambahkan data ke RxList pelangganList
      } else {
        // Handle kesalahan jika diperlukan
        print('Gagal mengambil data barang: ${response.statusText}');
      }
    } catch (error) {
      // Handle kesalahan jika diperlukan
      print('Terjadi kesalahan: $error');
    }
  }
}
