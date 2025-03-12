import 'package:flutter/material.dart';
import 'component.dart'; // Import file komponen

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Daftar percakapan
    List<Map<String, String>> chats = [
      {"name": "People 1", "message": "Halo, sudah siap untuk kelas pagi ini?", "time": "07.40"},
      {"name": "People 2", "message": "Jangan lupa tugasnya dikumpulin hari ini!", "time": "07.38"},
      {"name": "People 3", "message": "Saya baru saja upload materi baru.", "time": "07.30"},
      {"name": "People 4", "message": "Malam ini ada rapat kelompok, bisa ikut?", "time": "07.20"},
      {"name": "People 5", "message": "Terima kasih atas bantuannya kemarin!", "time": "07.15"},
      {"name": "People 6", "message": "Nanti kita ketemu di kafe ya.", "time": "07.10"},
      {"name": "People 7", "message": "Sudah lihat pengumuman terbaru?", "time": "07.00"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pesan & Group",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatTile(
            name: chats[index]["name"]!,
            message: chats[index]["message"]!,
            time: chats[index]["time"]!,
          );
        },
      ),
    );
  }
}