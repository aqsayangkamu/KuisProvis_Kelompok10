import 'package:flutter/material.dart';
import 'component.dart'; // Import file komponen

class KeuanganScreen extends StatelessWidget {
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
                "Keuangan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: 16),

          // Card Bayar UKT
          FinanceCard(
            icon: Icons.savings,
            title: "Bayar UKT",
            child: PaymentProgress(progress: 0.5, totalAmount: 6500000),
          ),

          // Card Transfer
          FinanceCard(
            icon: Icons.keyboard_arrow_down,
            title: "Transfer",
            child: TransferOption(),
          ),

          // Card Bantuan Keuangan
          FinanceCard(
            icon: Icons.help_outline,
            title: "Bantuan Keuangan",
            child: Column(
              children: [
                FinanceAidItem(title: "Bantuan Prestasi Akademik"),
                FinanceAidItem(title: "Bantuan Biaya UKT"),
              ],
            ),
          ),
        ],
      ),      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}