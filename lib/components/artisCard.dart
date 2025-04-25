import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtisCard extends StatelessWidget {
  final String imagePath;
  final String nama;
  final String lokasi;
  final String igFollowers;
  final String ytFollowers;
  final double rating;
  final String harga;

  const ArtisCard({
    Key? key,
    required this.imagePath,
    required this.nama,
    required this.lokasi,
    required this.igFollowers,
    required this.ytFollowers,
    required this.rating,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Gambar + Overlay
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  rating.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  lokasi,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Color(0xFFE1306C),
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  igFollowers,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.youtube,
                                  color: Color(0xFFFF0000),
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  ytFollowers,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Divider garis putus-putus
        Row(
          children: List.generate(30, (index) {
            return Expanded(
              child: Container(
                height: 1,
                color: index % 2 == 0 ? Colors.black : Colors.transparent,
              ),
            );
          }),
        ),

        // Harga
        Container(
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Text(
            harga,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
