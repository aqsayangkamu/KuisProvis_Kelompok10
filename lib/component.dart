import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Custom App Bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onProfileTap;

  CustomAppBar({this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle, color: Colors.white, size: 40),
          onPressed: onProfileTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// Tabel Jadwal Kuliah
class ScheduleTable extends StatelessWidget {
  final List<Map<String, String>> scheduleData = [
    {"hari": "Senin", "mata_kuliah": "Pemrograman Visual", "waktu": "09:30", "ruang": "C205"},
    {"hari": "Senin", "mata_kuliah": "Data Mining", "waktu": "13:00", "ruang": "C307"},
    {"hari": "Selasa", "mata_kuliah": "Jaringan Komputer", "waktu": "10:00", "ruang": "B101"},
    {"hari": "Rabu", "mata_kuliah": "Kecerdasan Buatan", "waktu": "08:00", "ruang": "A202"},
    {"hari": "Kamis", "mata_kuliah": "Basis Data", "waktu": "13:30", "ruang": "C103"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.green[100]),
        border: TableBorder.all(color: Colors.grey[300]!),
        columns: [
          DataColumn(label: Text("Hari", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Mata Kuliah", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Waktu", style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text("Ruang", style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: scheduleData.map((item) {
          return DataRow(cells: [
            DataCell(Text(item["hari"]!)),
            DataCell(Text(item["mata_kuliah"]!)),
            DataCell(Text(item["waktu"]!)),
            DataCell(Text(item["ruang"]!)),
          ]);
        }).toList(),
      ),
    );
  }
}

// Kartu Tugas
Widget buildCard(String title, String detail, IconData logo) {
  return Card(
    color: Colors.green[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: Colors.green[300]!, width: 1),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Biarkan teks sejajar di atas
        children: [
          // Ikon di sebelah kiri
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 1.5),
            ),
            padding: EdgeInsets.all(6),
            child: Icon(logo, color: Colors.green),
          ),

          SizedBox(width: 12),

          // Title & Detail dalam Column (Biar Atas-Bawah)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4), // Jarak antara title & detail
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 12, // Bisa sedikit diperbesar biar lebih terbaca
                    fontWeight: FontWeight.w400,
                    color: Colors.black54, // Warna sedikit lebih redup dari title
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


// Item Menu
Widget buildMenuItem(IconData icon, String title, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(title),
      ],
    ),
  );
}

// Navigasi Bawah
Widget buildBottomNavBar() {
  return BottomNavigationBar(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: "Medsos"),
      BottomNavigationBarItem(icon: Icon(Icons.school), label: "Elearning"),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Jadwal & todo"),
      BottomNavigationBarItem(icon: Icon(Icons.message), label: "Pesan & group"),
      BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifikasi"),
    ],
  );
}

class BeasiswaSection extends StatelessWidget {
  final List<Map<String, String>> beasiswaList = [
    {
      "nama": "Beasiswa Sampoerna",
      "detail": "Beasiswa Sampoerna adalah program beasiswa yang menawarkan kesempatan luar biasa bagi mahasiswa yang berprestasi namun membutuhkan dukungan finansial.",
      "imgPath": "assets/images/sampoerna.jpg",
    },
    {
      "nama": "Beasiswa LPDP",
      "detail": "Beasiswa LPDP adalah beasiswa yang dibiayai pemerintah untuk mahasiswa berprestasi yang ingin melanjutkan studi ke jenjang yang lebih tinggi.",
      "imgPath": "assets/images/lpdp.jpg",
    },
    {
      "nama": "Beasiswa Unggulan",
      "detail": "Beasiswa Unggulan diberikan kepada mahasiswa yang memiliki prestasi akademik dan non-akademik yang luar biasa.",
      "imgPath": "assets/images/unggulan.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 500,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
      ),
      items: beasiswaList.map((beasiswa) {
        return BeasiswaCard(
          nama: beasiswa["nama"]!,
          detail: beasiswa["detail"]!,
          imgPath: beasiswa["imgPath"]!,
        );
      }).toList(),
    );
  }
}

class BeasiswaCard extends StatelessWidget {
  final String nama;
  final String detail;
  final String imgPath;

  BeasiswaCard({required this.nama, required this.detail, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        color: Colors.green,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FractionallySizedBox(
                        widthFactor: 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              nama,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              detail,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// banyaknya yg dibawah ini buat halaman mental

class HeaderMentalHealth extends StatelessWidget {
  final String title;
  const HeaderMentalHealth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: CustomDecoration(),
        ),
      ],
    );
  }
}

/// Widget Dekorasi Bulatan di Header
class CustomDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CircleAvatar(radius: 10, backgroundColor: Colors.yellow),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: CircleAvatar(radius: 10, backgroundColor: Colors.yellow),
        ),
        Positioned(
          top: 20,
          right: -10,
          child: CircleAvatar(radius: 10, backgroundColor: Colors.yellow),
        ),
      ],
    );
  }
}

/// Widget untuk Avatar + Informasi
class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Avatar
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 10),
          // Informasi
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget untuk Dua Kotak Alat Bantu Mandiri
class MentalHealthToolCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color iconColor;

  const MentalHealthToolCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: iconColor.withOpacity(0.2),
              radius: 20,
              child: Icon(icon, color: iconColor, size: 24),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ini dari akademik

class PuzzleMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;
  final Color iconColor;

  const PuzzleMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Ikon di bagian atas
          Positioned(
            top: 10,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.3),
              radius: 12,
              child: Icon(icon, size: 14, color: iconColor),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.3),
              radius: 12,
              child: Icon(Icons.lock, size: 14, color: iconColor),
            ),
          ),
          // Bentuk puzzle (simulasi dengan border radius)
          Positioned(
            bottom: 0,
            right: -10,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Teks Judul
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ini dari keuangan

class FinanceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const FinanceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 14,
                child: Icon(icon, color: Colors.white, size: 16),
              ),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

// Widget untuk progress pembayaran UKT
class PaymentProgress extends StatelessWidget {
  final double progress;
  final int totalAmount;

  const PaymentProgress({
    Key? key,
    required this.progress,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.black),
        SizedBox(height: 4),
        Text(
          "Total Tagihan:   Rp ${totalAmount.toStringAsFixed(0)}",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 12,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Container(
              height: 12,
              width: MediaQuery.of(context).size.width * progress,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text("Terbayar ${(progress * 100).toInt()}%"),
      ],
    );
  }
}

// Widget untuk pilihan transfer
class TransferOption extends StatelessWidget {
  const TransferOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("Pilih metode pembayaran"),
          ),
        ),
        SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 16,
          child: Icon(Icons.add, color: Colors.white, size: 18),
        ),
      ],
    );
  }
}

// Widget untuk bantuan keuangan
class FinanceAidItem extends StatelessWidget {
  final String title;

  const FinanceAidItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 14)),
          Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }
}

// ini buat sosmed

class TweetCard extends StatelessWidget {
  final IconData profileImage;
  final String username;
  final String handle;
  final String tweet;
  final String timestamp;

  const TweetCard({
    Key? key,
    required this.profileImage,
    required this.username,
    required this.handle,
    required this.tweet,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(profileImage, size: 40, color: Colors.black54),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      handle,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  timestamp,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(tweet),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.comment, color: Colors.grey),
                Icon(Icons.repeat, color: Colors.grey),
                Icon(Icons.favorite_border, color: Colors.grey),
                Icon(Icons.share, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// notif


class NotificationCard extends StatelessWidget {
  final String icon;
  final String message;

  const NotificationCard({
    Key? key,
    required this.icon,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: Icon(
          icon == "notifications" ? Icons.notifications : Icons.book,
          color: Colors.brown,
          size: 30,
        ),
        title: Text(
          message,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

// chat
class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const ChatTile({
    Key? key,
    required this.name,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            time,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Divider(), // Garis pemisah antar chat
      ],
    );
  }
}