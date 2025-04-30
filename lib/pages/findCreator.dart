import 'package:flutter/material.dart';
import '../components/briefCard.dart'; // Pastikan BriefCard sudah didefinisikan dengan benar
import '../components/artisCard.dart'; // Mengimpor ArtisCard dari komponen
import '../pages/creatorPrice.dart'; // Tambahan: untuk navigasi ke contractSignin

class FindCreator extends StatelessWidget {
  const FindCreator({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample campaign data
    final List<Campaign> campaigns = [
      Campaign(
        title: 'Campaign 1',
        productName: 'Product 1',
        category: 'Category 1',
        platform: 'Platform 1',
        price: '1000',
        campaignPeriod: '2025-01-01 to 2025-02-01',
        imagePath: 'assets/Baju.jpg',
        campaignDate: DateTime.now(),
      ),
      // Add more campaigns here
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Campaign List')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Campaign List (BriefCard)
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  for (var campaign in campaigns) BriefCard(campaign: campaign),
                ],
              ),
            ),

            // Search bar and filter button below the campaign list
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search your campaign or favorite artist",
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(Icons.filter_list, color: Colors.white),
                  ),
                ],
              ),
            ),

            // GridView for ArtisCard
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: (MediaQuery.of(context).size.width / 2) / 340,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CombinedPage()),
                      );
                    },
                    child: ArtisCard(
                      imagePath: 'assets/Baju.jpg',
                      nama: 'Nama Creator',
                      lokasi: 'Jakarta',
                      igFollowers: '22.4 M',
                      ytFollowers: '12.8 M',
                      rating: 5.0,
                      harga: 'Start from Rp. 1.2 M',
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
