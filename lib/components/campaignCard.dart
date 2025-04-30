import 'package:flutter/material.dart';

class CampaignCard extends StatelessWidget {
  final String imagePath;
  final String campaignName;
  final String createdTime;

  const CampaignCard({
    Key? key,
    required this.imagePath,
    required this.campaignName,
    required this.createdTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),

          // Judul
          Text(
            campaignName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 1),

          // Waktu
          Text(
            createdTime,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),

          // Tombol
          SizedBox(
            height: 35,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                print('Show More dari $campaignName');
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF3E54AC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30),
              ),
              child: Text(
                'Show More',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
