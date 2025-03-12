import 'package:flutter/material.dart';
import 'component.dart'; // Import file komponen

class jadwalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Hijau
            HeaderMentalHealth(title: "Jadwal dan to do"),
            ScheduleTable(),

            SizedBox(height: 20),

            buildCard("Pemrograman Web – Buat halaman login dan dashboard menggunakan Laravel & Tailwind CSS", "🕒 Deadline: 15 Maret 2025", Icons.web),
            buildCard("Kecerdasan Buatan – Implementasi model Machine Learning dengan Scikit-learn dan XGBoost", "🕒 Deadline: 18 Maret 2025", Icons.memory),
            buildCard("Jaringan Komputer – Konfigurasi jaringan dengan banyak router menggunakan Cisco Packet Tracer", "🕒 Deadline: 20 Maret 2025", Icons.router),
            buildCard("Struktur Data – Implementasi algoritma sorting pada linked list menggunakan C++", "🕒 Deadline: 22 Maret 2025", Icons.list),
            buildCard("Sistem Basis Data – Buat database manajemen perpustakaan dengan MySQL", "🕒 Deadline: 25 Maret 2025", Icons.storage),
            buildCard("Metodologi Penelitian – Tulis laporan penelitian tentang peran AI dalam pendidikan", "🕒 Deadline: 27 Maret 2025", Icons.book),
            buildCard("Keamanan Informasi – Analisis dan enkripsi data menggunakan AES dan RSA", "🕒 Deadline: 30 Maret 2025", Icons.lock),

            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}