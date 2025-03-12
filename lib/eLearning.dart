import 'package:flutter/material.dart';
import 'component.dart'; // Import file komponen

class ElearnigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Hijau
            HeaderMentalHealth(title: "E-Learning"),

            SizedBox(height: 30),

            // Dua Kotak Alat Bantu Mandiri
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MentalHealthToolCard(
                  icon: Icons.bookmark,
                  title: "Progres Belajar",
                  subtitle: "Pantau rogres pembelajaran",
                  backgroundColor: Colors.yellow[100]!,
                  iconColor: Colors.yellow[700]!,
                ),
                SizedBox(width: 12),
                MentalHealthToolCard(
                  icon: Icons.chat,
                  title: "Forum Diskusi",
                  subtitle: "Diskusi Bersama",
                  backgroundColor: Colors.blue[100]!,
                  iconColor: Colors.teal[700]!,
                ),
                SizedBox(width: 12),
                MentalHealthToolCard(
                  icon: Icons.list,
                  title: "Mata Kuliah",
                  subtitle: "Daftar mata kuliah",
                  backgroundColor: Colors.pink[100]!,
                  iconColor: Colors.pink[700]!,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}