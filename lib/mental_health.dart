import 'package:flutter/material.dart';
import 'component.dart'; // Import file komponen

class MentalHealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Hijau
            HeaderMentalHealth(title: "Mental Health"),

            SizedBox(height: 20),

            buildCard("counselling center", "08231235345", Icons.person),
            buildCard("Hotline Kesehatan Mental Nasional", "119", Icons.warning_amber),

            SizedBox(height: 20),

            // Judul "Alat Bantu Mandiri"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Alat Bantu Mandiri",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),

            SizedBox(height: 10),

            // Dua Kotak Alat Bantu Mandiri
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MentalHealthToolCard(
                  icon: Icons.wb_sunny_rounded,
                  title: "Mood Tracker",
                  subtitle: "Pantau suasana hatimu",
                  backgroundColor: Colors.yellow[100]!,
                  iconColor: Colors.yellow[700]!,
                ),
                SizedBox(width: 12),
                MentalHealthToolCard(
                  icon: Icons.self_improvement,
                  title: "Meditasi",
                  subtitle: "Panduan relaksasi",
                  backgroundColor: Colors.blue[100]!,
                  iconColor: Colors.teal[700]!,
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