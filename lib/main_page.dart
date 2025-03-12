import 'package:flutter/material.dart';
import 'package:kuis/akademik.dart';
import 'component.dart';
import 'mental_health.dart';
import 'akademik.dart';
import 'keuangan.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onProfileTap: () {
          print("Tombol Profil Ditekan!");
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BeasiswaSection(),
            ScheduleTable(),
            buildCard("EDA 1 (10 Maret 2025)", "Analisis Data Frame", Icons.insert_drive_file),
            buildCard("EDA 2 (17 Maret 2025)", "Analisis Data Frame", Icons.insert_drive_file),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16), // Menambah jarak atas dan bawah
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMenuItem(Icons.favorite_border, "Mental Health", (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MentalHealthScreen()),
                    );
                  }),
                  buildMenuItem(Icons.folder, "Akademik", (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AkademikPage()),
                    );
                  }),
                  buildMenuItem(Icons.cut, "Keuangan", (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KeuanganScreen()),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}
