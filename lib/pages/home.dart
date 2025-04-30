import 'package:cobacoba/pages/campaignDetail.dart';
import 'package:flutter/material.dart';
import '../components/campaignCard.dart';
import '../components/artisCard.dart';
import 'package:cobacoba/pages/createCampaign.dart';
import '../components/traffic_chart.dart';
import 'package:cobacoba/pages/artistDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        // << ini biar gak mentok ke notch / status bar
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 30,
          ), // << jarak atas bisa atur di sini
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==== HEADER ====
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(''),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome Back',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 0.1),
                        Text(
                          'Rizki Ilhamnuddin',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ==== SEARCH + FILTER ====
              Row(
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

              const SizedBox(height: 24),

              //Campaign container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateCampaignPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 88,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3E54AC), Color(0xFF655DBB)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Create Campaign",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Click here to start your own campaign",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.add, color: Colors.white),
                    ],
                  ),
                ),
              ),

              //Trafic Container
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Traffic",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Text(
                          "327",
                          style: TextStyle(
                            color: Color(0xff51556B),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Campaigns",
                          style: TextStyle(
                            color: Color(0xffA3AED0),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TrafficChart(
                      trafficData: [
                        {"month": "Aug", "count": 4},
                        {"month": "Sept", "count": 3},
                        {"month": "Oct", "count": 8},
                        {"month": "Nov", "count": 5},
                        {"month": "Dec", "count": 7},
                        {"month": "Jan", "count": 11},
                        {"month": "Feb", "count": 2},
                      ],
                    ),
                  ],
                ),
              ),
              //campaign container
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Recent Campaign",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // === Filter Buttons ===
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  final isSelected = selectedIndex == index;
                  final labels = ['All', 'On Going', 'Done'];
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isSelected
                                  ? const Color(0xFF3E54AC)
                                  : Colors.white,
                          foregroundColor:
                              isSelected
                                  ? Colors.white
                                  : const Color(0xFF3E54AC),
                          elevation: 0,
                          side: const BorderSide(color: Color(0xFF3E54AC)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                isSelected
                                    ? Colors.white
                                    : const Color(0xFF3E54AC),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// campaign product
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const CampaignDetailPage(
                                currentStep: 2,
                              ), // Panggil ke halaman detail
                        ),
                      );
                    },
                    child: CampaignCard(
                      imagePath: 'assets/Baju.jpg',
                      campaignName: 'Campaign ${index + 1}',
                      createdTime: 'Created ${5 * (index + 1)} minutes ago',
                    ),
                  );
                }),
              ),

              SizedBox(height: 10),

              // ==== KONTEN LAIN ====
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: (MediaQuery.of(context).size.width / 2) / 340,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
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
            ],
          ),
        ),
      ),
    );
  }
}
