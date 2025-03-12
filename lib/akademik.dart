import 'package:flutter/material.dart';
import 'component.dart'; // Import file component.dart

class AkademikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                "Akademik",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: 16),

          // Informasi Box
          BeasiswaSection(),

          SizedBox(height: 16),

          // Menu Akademik
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PuzzleMenuItem(
                  icon: Icons.school,
                  title: "Transkrip Nilai",
                  backgroundColor: Colors.redAccent,
                  iconColor: Colors.white,
                ),
                PuzzleMenuItem(
                  icon: Icons.article,
                  title: "Nilai",
                  backgroundColor: Colors.green,
                  iconColor: Colors.white,
                ),
                PuzzleMenuItem(
                  icon: Icons.star,
                  title: "Status Akademis",
                  backgroundColor: Colors.purple,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}
