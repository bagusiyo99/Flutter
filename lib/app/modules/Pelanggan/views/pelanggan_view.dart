import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

import '../controllers/pelanggan_controller.dart';

String formatCurrency(double amount) {
  final currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  return currencyFormat.format(amount);
}

final PelangganController pelangganController =
    Get.find(); // Ambil instansi controller

class PelangganView extends GetView<PelangganController> {
  const PelangganView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pembeli'),
        backgroundColor: Colors.green,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: pelangganController.pelangganList.length,
          itemBuilder: (context, index) {
            final pelanggan = pelangganController.pelangganList[index];
            // Memformat tanggal di dalam itemBuilder
            final createdDate = DateTime.tryParse(pelanggan['created_at']);
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
                    pelanggan['nama'].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white, // Atur warna teks
                      fontSize: 18, // Atur ukuran teks
                    ),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alamat: ${pelanggan['alamat']}',
                        style: const TextStyle(
                            color: Colors.white)), // Atur warna teks

                    Text('WhatsApp atau Telpon: ${pelanggan['hp']}',
                        style: const TextStyle(color: Colors.white)),

                    Text('Pembelian : $formattedDate',
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
