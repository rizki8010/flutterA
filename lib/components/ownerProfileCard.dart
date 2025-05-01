import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Tombol Kembali
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Avatar + Tombol Kamera
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/ownerProfile.png"),
              ),
              Positioned(
                bottom: 0,
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.camera_alt, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Teks Jabatan
          const Text(
            "Business Owner",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),

          // Negara dan Tombol "Contact Here"
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Indonesia"),
              const SizedBox(width: 8),
              Container(
                height: 28,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Contact Here",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Deskripsi
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui risus, commodo ac malesuada non, pulvinar sit amet nisl. Curabitur a augue laoreet nunc euismod mollis.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 16),

          // Box Media Sosial Horizontal
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly, // Menambahkan jarak antar elemen
              children: [
                const _SocialMediaStat(
                  iconAsset: 'assets/icons/instagram.png',
                  label: "Followers",
                  value: "22.4M",
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                  width: 1,
                ),
                const _SocialMediaStat(
                  iconAsset: 'assets/icons/youtube.jpg',
                  label: "Subscribers",
                  value: "22.4M",
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                  width: 1,
                ),
                const _SocialMediaStat(
                  iconAsset: 'assets/icons/tiktok.png',
                  label: "Followers",
                  value: "-",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialMediaStat extends StatelessWidget {
  final String iconAsset;
  final String label;
  final String value;

  const _SocialMediaStat({
    required this.iconAsset,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(iconAsset, height: 28, width: 28, fit: BoxFit.contain),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}
