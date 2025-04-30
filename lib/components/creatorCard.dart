import 'package:flutter/material.dart';
import '../pages/contractSigning.dart'; // Atau sesuaikan path kamu

class CreatorProfileCard extends StatelessWidget {
  const CreatorProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const Text(
            'Influencer Name',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 4),
              Text('/ 92 ratings', style: TextStyle(color: Colors.black)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            children: [
              _buildTag('Actor'),
              _buildTag('Culinary'),
              _buildTag('+2'),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat(Icons.repeat, '94 times', 'Endorse'),
                _buildStat(
                  Icons.camera_alt,
                  '22.4M',
                  'Followers',
                  iconPath: 'assets/icons/instagram.png',
                ),
                _buildStat(
                  Icons.play_circle_fill,
                  '22.4M',
                  'Subscribers',
                  iconPath: 'assets/icons/youtube.jpg',
                ),
                _buildStat(
                  Icons.music_note,
                  '22.4M',
                  'Followers',
                  iconPath: 'assets/icons/tiktok.png',
                ),
              ],
            ),
          ),


          const SizedBox(height: 24),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'ABOUT',
              style: TextStyle(fontSize: 16, color: Color(0xFF5E6C84)),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui risus, commodo ac malesuada non, pulvinar sit amet nisl. Curabitur a augue laoreet nunc euismod mollis.',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildTag(String label) {
    return Chip(
      label: Text(label, style: TextStyle(color: Colors.white)),
      backgroundColor: const Color(0xFF655DBB),
    );
  }

  Widget _buildStat(
    IconData icon,
    String value,
    String label, {
    String? iconPath,
  }) {
    return Column(
      children: [
        iconPath != null
            ? Image.asset(
              iconPath,
              width: 45, // <<<<< Lebih besar diubah dari 36 jadi 56
              height: 45,
            )
            : Icon(icon, size: 36),
        const SizedBox(height: 8),
        if (value.isNotEmpty)
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }
}
