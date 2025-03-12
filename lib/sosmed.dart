import 'package:flutter/material.dart';
import 'component.dart'; // Import file komponen

class sosmedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
        body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          TweetCard(
            profileImage: Icons.account_circle,
            username: "ruby pradana",
            handle: "@blayrublay",
            tweet:
                "aku lapar",
            timestamp: "2h",
          ),
          TweetCard(
            profileImage: Icons.account_circle,
            username: "dessi H",
            handle: "@dessih",
            tweet:
                "PUASAA LAMAA",
            timestamp: "5h",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi untuk membuat tweet baru
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}