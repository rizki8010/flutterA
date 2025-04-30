import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TestimonialCard extends StatelessWidget {
  final Color avatarColor;
  final String name;
  final String comment;
  final String timeAgo;
  final double rating;

  const TestimonialCard({
    Key? key,
    required this.avatarColor,
    required this.name,
    required this.comment,
    required this.timeAgo,
    this.rating = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 24, backgroundColor: avatarColor),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder:
                      (context, index) => Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(height: 8),
                Text(comment, style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text(
                  timeAgo,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
