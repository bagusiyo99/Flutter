import 'package:get/get.dart';
import 'package:gudang/app/data/barang_provider.dart';

class BarangController extends GetxController {
  final BarangProvider barangProvider =
      BarangProvider(); // Buat instansi dari provider

  RxList barangList = [].obs; // RxList untuk menyimpan data barang dari API

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Panggil fetchData saat controller diinisialisasi
  }

  void fetchData() async {
    try {
      final response =
          await barangProvider.menu(); // Panggil metode menu() dari provider
      if (response.status.isOk) {
        final List responseData = response.body; // Ambil data dari respons
        barangList
            .assignAll(responseData); // Tambahkan data ke RxList barangList
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
