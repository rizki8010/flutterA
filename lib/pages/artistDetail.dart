import 'package:flutter/material.dart';
import '../components/testimonial_card.dart';
import '../components/price_card.dart';
import '../components/creatorCard.dart';

class CombinedPage extends StatefulWidget {
  const CombinedPage({Key? key}) : super(key: key);

  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  List<String> selectedPrices = []; // Menyimpan harga yang dipilih
  int totalPrice = 0; // Menyimpan total harga yang dipilih

  void _updateTotalPrice(bool isSelected, String price) {
    setState(() {
      if (isSelected) {
        selectedPrices.add(price);
        totalPrice +=
            int.tryParse(
              price.replaceAll('Rp', '').replaceAll('.', '').trim(),
            ) ??
            0;
      } else {
        selectedPrices.remove(price);
        totalPrice -=
            int.tryParse(
              price.replaceAll('Rp', '').replaceAll('.', '').trim(),
            ) ??
            0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> commonFeatures = [
      'Appear on feeds',
      'Need to ship the product',
      'Can stitch content',
      '3 draft revisions',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Creator Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Creator Profile
            CreatorProfileCard(),

            const SizedBox(height: 8),

            // Price List
            const Text(
              'PRICE',
              style: TextStyle(fontSize: 16, color: Color(0xFF5E6C84)),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
              children: [
                PriceCard(
                  title: 'Reels-1minute',
                  features: commonFeatures,
                  price: 'Rp42.000.000',
                  onSelected: _updateTotalPrice,
                ),
                PriceCard(
                  title: 'Reels-2minute',
                  features: commonFeatures,
                  price: 'Rp42.000.000',
                  onSelected: _updateTotalPrice,
                ),
                PriceCard(
                  title: 'Reels-3minute',
                  features: commonFeatures,
                  price: 'Rp42.000.000',
                  onSelected: _updateTotalPrice,
                ),
                PriceCard(
                  title: 'Feeds-Week',
                  features: commonFeatures,
                  price: 'Rp42.000.000',
                  onSelected: _updateTotalPrice,
                ),
                PriceCard(
                  title: 'Feeds-Month',
                  features: commonFeatures,
                  price: 'Rp42.000.000',
                  onSelected: _updateTotalPrice,
                ),
                PriceCard(
                  title: 'Feeds-Permanent',
                  features: commonFeatures,
                  price: 'Rp42.000.000',
                  onSelected: _updateTotalPrice,
                ),
                PriceCard(
                  title: 'Story',
                  features: commonFeatures,
                  price: 'Rp42.000.000',
                  onSelected: _updateTotalPrice,
                ),
                PriceCard(
                  title: 'Live-Week',
                  features: commonFeatures,
                  price: 'Rp42.000.000',
                  onSelected: _updateTotalPrice,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Testimonials
            const Text(
              'CLIENT SATISFACTION',
              style: TextStyle(fontSize: 16, color: Color(0xFF5E6C84)),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                TestimonialCard(
                  avatarColor: Colors.pink,
                  name: 'A**** N**',
                  comment:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui risus...',
                  timeAgo: '1 hour ago',
                ),
                TestimonialCard(
                  avatarColor: Colors.indigo[900]!,
                  name: 'A**** N**',
                  comment:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui risus...',
                  timeAgo: '1 hour ago',
                ),
                TestimonialCard(
                  avatarColor: Colors.blue,
                  name: 'A**** N**',
                  comment:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui risus...',
                  timeAgo: '1 hour ago',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
