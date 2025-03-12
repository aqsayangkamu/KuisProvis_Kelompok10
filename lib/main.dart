import 'package:flutter/material.dart';
import 'package:kuis/akademik.dart';
import 'package:kuis/pesan.dart';
import 'main_page.dart';
import 'component.dart';
import 'mental_health.dart';
import 'akademik.dart';
import 'keuangan.dart';
import 'eLearning.dart';
import 'sosmed.dart';
import 'notif.dart';
import 'pesan.dart';
import 'jadwal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: kuisScreen(),
    );
  }
}

class kuisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onProfileTap: () {
          print("Tombol Profil Ditekan!");
        },
      ),
      body: SingleChildScrollView(
        child: Center( // Memastikan semua konten berada di tengah
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Memusatkan secara vertikal
            crossAxisAlignment: CrossAxisAlignment.center,  // Memusatkan secara horizontal
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16), // Menambah jarak atas dan bawah
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Memusatkan secara vertikal
                  crossAxisAlignment: CrossAxisAlignment.center, // Memusatkan secara horizontal
                  children: [
                    Text(
                      "Kuis Provis Kelompok 10",
                      style: TextStyle(
                        fontSize: 30, // Atur ukuran font
                        fontWeight: FontWeight.bold, // Membuat teks menjadi bold
                      ),
                    ),
                    Text(
                      "Muhammad Ruby Pradana Syamsun (2304191)",
                      style: TextStyle(
                        fontSize: 16, // Atur ukuran font
                      ),
                    ),
                    Text(
                      "Dessi Husna Isnaini (2310974)",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    buildMenuItem(Icons.pageview_sharp, "Main Page", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }),
                    buildMenuItem(Icons.favorite_border, "Mental Health", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MentalHealthScreen()),
                      );
                    }),
                    buildMenuItem(Icons.folder, "Akademik", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AkademikPage()),
                      );
                    }),
                    buildMenuItem(Icons.cut, "Keuangan", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KeuanganScreen()),
                      );
                    }),
                    buildMenuItem(Icons.book_sharp, "Elearning", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ElearnigScreen()),
                      );
                    }),
                    buildMenuItem(Icons.camera_alt_outlined, "sosmed", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sosmedScreen()),
                      );
                    }),
                    buildMenuItem(Icons.notification_important_rounded, "notif", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotifScreen()),
                      );
                    }),
                    buildMenuItem(Icons.chat, "Chat & Group", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    }),
                    buildMenuItem(Icons.calendar_month, "Jadwal & todo", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => jadwalScreen()),
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
