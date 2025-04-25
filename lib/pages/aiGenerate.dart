import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AIGeneratePage extends StatelessWidget {
  const AIGeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMM yyyy – HH:mm').format(now);

    return Scaffold(
      appBar: AppBar(title: const Text("Breif Insight")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Baris atas: Gambar & info
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/Baju.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Healthy Snack Promo",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Kak Rizki Muria",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          const InfoRow(
                            label: "Product Name",
                            value: "Organic Granola",
                          ),
                          const InfoRow(
                            label: "Category",
                            value: "Food & Beverage",
                          ),
                          const InfoRow(label: "Platform", value: "Instagram"),
                          const InfoRow(label: "Price", value: "Rp500.000"),
                          const InfoRow(
                            label: "Campaign Period",
                            value: "1 May - 15 May 2025",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(height: 1, color: Colors.grey),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Text(
                  ":",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
