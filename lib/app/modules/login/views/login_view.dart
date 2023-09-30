import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gudang/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Pergudangan'),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 247, 245), //warna body
      body: Container(
        padding: const EdgeInsets.all(25),
        color: Colors.white, // Atur warna latar belakang di sini
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ), // Atur margin atas dan bawah di sini
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50, // Ukuran font
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
                  "data pendapatan dan penjualanan",
                  style: TextStyle(
                    fontSize: 18, // Ukuran font
                    fontWeight: FontWeight.normal, // Ketebalan font
                    color: Color.fromARGB(255, 236, 1, 1), // Warna teks
                    // decoration: TextDecoration
                    //     .underline, // Dekorasi teks (misalnya, garis bawah)
                  ),
                ),
              ),
              // untuk login
              const SizedBox(height: 25),
              TextField(
                controller: controller.textEmail,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(
                      // Mengatur sudut border secara vertikal
                      top: Radius.circular(
                          20.0), // Mengatur sudut atas menjadi bulat
                      bottom: Radius.circular(
                          20.0), // Mengatur sudut bawah menjadi bulat
                    ),
                    borderSide: BorderSide(
                      // Mengatur warna dan ketebalan border
                      color: Colors.red, // Warna border
                      width: 3.0, // Ketebalan border
                    ),
                  ), // Menambahkan border
                ),
              ),

              const SizedBox(height: 25),
              TextField(
                controller: controller.textPassword,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(
                      // Mengatur sudut border secara vertikal
                      top: Radius.circular(
                          20.0), // Mengatur sudut atas menjadi bulat
                      bottom: Radius.circular(
                          20.0), // Mengatur sudut bawah menjadi bulat
                    ),
                    borderSide: BorderSide(
                      // Mengatur warna dan ketebalan border
                      color: Color.fromARGB(255, 246, 18, 2), // Warna border
                      width: 3.0, // Ketebalan border
                    ),
                  ), // Menambahkan border
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => controller.auth(),
                // ignore: sort_child_properties_last
                child: Container(
                  width:
                      double.infinity, // Agar tombol mengambil lebar maksimum
                  height: 40, // Sesuaikan dengan tinggi yang Anda inginkan
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
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
