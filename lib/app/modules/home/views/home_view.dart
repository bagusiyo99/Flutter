import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:gudang/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: const Text('Pergudangan'),
      ),
      body: Container(
        color: Colors.white, // Atur warna latar belakang di sini
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ), // Atur margin atas dan bawah di sini
                child: Image.asset(
                  "gambar/login.png",
                  width: 300,
                  height: 300,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ), // Atur margin atas dan bawah di sini
                child: const Text(
                  "Aplikasi Gudang",
                  style: TextStyle(
                    fontSize: 24, // Ukuran font
                    fontWeight: FontWeight.bold, // Ketebalan font
                    color: Colors.green, // Warna teks
                    // fontStyle: FontStyle.italic, // Gaya font (misalnya, italic)
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ), // Atur margin atas dan bawah di sini
                child: const Text(
                  "Data pendapatan dan penjualanan toko",
                  style: TextStyle(
                    fontSize: 18, // Ukuran font
                    fontWeight: FontWeight.normal, // Ketebalan font
                    color: Color.fromARGB(255, 31, 31, 31), // Warna teks
                    // decoration: TextDecoration
                    //     .underline, // Dekorasi teks (misalnya, garis bawah)
                  ),
                ),
              ),
              // untuk login
              Container(
                // ignore: prefer_const_constructors
                margin: EdgeInsets.only(
                    top: 10, bottom: 10), // Atur margin atas dan bawah di sini
                child: ElevatedButton(
                  // onPressed: () {
                  //   Aksi yang dilakukan saat tombol ditekan
                  //   Get.toNamed(Routes.HOME);
                  //   controller.OnTapLogin();
                  // },
                  onPressed: () => controller.OnTapLogin(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Warna latar belakang
                    // ignore: deprecated_member_use
                    onPrimary: Colors.white, // Warna teks
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Radius border
                    ),
                    minimumSize:
                        const Size(130, 50), // Atur ukuran minimum tombol
                    // Atau, gunakan fixedSize untuk mengatur ukuran tetap:
                    // fixedSize: Size(150, 50),
                  ),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20, // Atur ukuran teks di sini
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
