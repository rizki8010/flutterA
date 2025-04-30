import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl untuk format tanggal

class Campaign {
  final String title;
  final String productName;
  final String category;
  final String platform;
  final String price;
  final String campaignPeriod;
  final String imagePath;
  final DateTime campaignDate;

  Campaign({
    required this.title,
    required this.productName,
    required this.category,
    required this.platform,
    required this.price,
    required this.campaignPeriod,
    required this.imagePath,
    required this.campaignDate,
  });
}

class BriefCard extends StatelessWidget {
  final Campaign campaign;

  const BriefCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final formattedDateString = DateFormat(
      'dd MMM yyyy – HH:mm',
    ).format(campaign.campaignDate);

    return Container(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  campaign.imagePath,
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
                    Text(
                      campaign.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formattedDateString,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    InfoRow(label: "Product Name", value: campaign.productName),
                    InfoRow(label: "Category", value: campaign.category),
                    InfoRow(label: "Platform", value: campaign.platform),
                    InfoRow(label: "Price", value: campaign.price),
                    InfoRow(
                      label: "Campaign Period",
                      value: campaign.campaignPeriod,
                    ),

                    // brief button
                    Row(
                      children: [
                        // Menggunakan Expanded agar tombol memanjang
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Tambahkan aksi di sini
                            },
                            icon: const Icon(
                              Icons.download,
                              size: 18,
                            ), // Ikon download
                            label: const Text('Brief'), // Teks tombol
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Warna tombol biru
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
