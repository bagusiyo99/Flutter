import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/barang_controller.dart';

String formatCurrency(double amount) {
  final currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  return currencyFormat.format(amount);
}

final BarangController barangController =
    Get.find(); // Ambil instansi controller

class BarangView extends GetView<BarangController> {
  const BarangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Barang'),
        backgroundColor: Colors.green,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: barangController.barangList.length,
          itemBuilder: (context, index) {
            final barang = barangController.barangList[index];
            // Memformat tanggal di dalam itemBuilder
            final createdDate = DateTime.tryParse(barang['created_at']);
            final formattedDate = createdDate != null
                ? DateFormat('dd MMMM yyyy', 'id_ID').format(createdDate)
                : 'Tanggal tidak valid'; // Tampilkan pesan jika tanggal tidak valid
            return Container(
              margin: const EdgeInsets.only(bottom: 8), // Atur margin bawah
              decoration: BoxDecoration(
                color: Colors.green, // Atur warna latar belakang di sini
                borderRadius: BorderRadius.circular(10), // Atur sudut elemen
              ),
              child: ListTile(
                title: Container(
                  margin: const EdgeInsets.only(
                      bottom: 8), // Atur margin bottom di sini
                  child: Text(
                    barang['nama_barang'].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white, // Atur warna teks
                      fontSize: 18, // Atur ukuran teks
                    ),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harga: ${formatCurrency(double.parse(barang['harga_barang']))}',
                      style: const TextStyle(
                          color: Colors.white), // Atur warna teks
                    ),
                    Text('Kode Barang: ${barang['kode_barang']}',
                        style: const TextStyle(
                            color: Colors.white)), // Atur warna teks

                    Text('Stok Awal: ${barang['stok_awal']}',
                        style: const TextStyle(color: Colors.white)),

                    Text('Stok Terkini : ${barang['jumlah_barang']}',
                        style: const TextStyle(
                            color: Colors
                                .white)), // Atur warna teks// Atur warna teks
                    Text('Barang Masuk: $formattedDate',
                        style: const TextStyle(
                            color: Colors.white)), // Atur warna teks

                    // Tambahkan detail lain yang Anda ingin tampilkan di sini
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
