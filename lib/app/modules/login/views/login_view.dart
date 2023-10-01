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
      backgroundColor:
          const Color.fromARGB(255, 245, 247, 245), // Warna latar belakang
      body: SingleChildScrollView(
        // Menggunakan SingleChildScrollView untuk menghindari overflow
        child: Container(
          padding: const EdgeInsets.all(25),
          color: Colors.white, // Warna latar belakang kontainer
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: const Text(
                    "testing data pendapatan dan penjualan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 236, 1, 1),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: controller.textEmail,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                        bottom: Radius.circular(20.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: controller.textPassword,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                        bottom: Radius.circular(20.0),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 246, 18, 2),
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => controller.auth(),
                  child: Container(
                    width: double.infinity,
                    height: 40,
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
      ),
    );
  }
}
