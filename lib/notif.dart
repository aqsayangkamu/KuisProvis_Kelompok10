import 'package:flutter/material.dart';
import 'component.dart'; // Import file komponen

class NotifScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Daftar notifikasi
    List<Map<String, String>> notifications = [
      {
        "icon": "notifications",
        "message":
            "Jangan lupa! Kuliah Pemrograman Mobile dimulai pukul 08:00 WIB di Gedung FPMIPA B, Ruang 203."
      },
      {
        "icon": "book",
        "message":
            "Modul baru telah diunggah untuk kursus Data Structures and Algorithms. Segera pelajari materi Sorting Algorithms!"
      },
      {
        "icon": "notifications",
        "message":
            "Jangan lupa! Kuliah Pemrograman Mobile dimulai pukul 08:00 WIB di Gedung FPMIPA B, Ruang 203."
      },
      {
        "icon": "book",
        "message":
            "Modul baru telah diunggah untuk kursus Data Structures and Algorithms. Segera pelajari materi Sorting Algorithms!"
      },
      {
        "icon": "notifications",
        "message":
            "Jangan lupa! Kuliah Pemrograman Mobile dimulai pukul 08:00 WIB di Gedung FPMIPA B, Ruang 203."
      },
      {
        "icon": "book",
        "message":
            "Modul baru telah diunggah untuk kursus Data Structures and Algorithms. Segera pelajari materi Sorting Algorithms!"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifikasi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(
            icon: notifications[index]["icon"]!,
            message: notifications[index]["message"]!,
          );
        },
      ),
    );
  }
}