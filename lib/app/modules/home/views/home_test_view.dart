import 'package:belajar_get_x/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {

  @override
  Widget build(context) {

    // Instansiasi kelas anda menggunakan Get.put() untuk membuatnya tersedia untuk seluruh "child" route dibawahnya.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Gunakan Obx(() => ...) untuk mengupdate Text() ketika `count` berubah.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Ganti 8 baris Navigator.push menggunan Get.to() agar lebih sederhana. Anda tidak perlu `context`.
        body: Center(child: ElevatedButton(
            child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // Anda bisa meminta Get untuk menemukan kontroler yang digunakan di halaman lain dan redirect ke halaman itu.
  final Controller c = Get.find();

  @override
  Widget build(context){
    // Akses variabel `count` yang telah di update.
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}