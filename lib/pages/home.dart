// lib/pages/home_page.dart

import 'package:cobacoba/pages/campaignDetail.dart';
import 'package:flutter/material.dart';
import '../components/campaignCard.dart'; // Check path
import '../components/artisCard.dart'; // Check path
import 'package:cobacoba/pages/createCampaign.dart'; // Check path
import '../components/traffic_chart.dart'; // Check path
import 'package:cobacoba/pages/artistDetail.dart'; // Check path - Assuming CombinedPage is here
import '../components/filter_component.dart'; // Import the filter component
import 'package:cobacoba/pages/profileOwnerPage.dart'; // Pastikan path-nya benar

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // For 'All', 'On Going', 'Done' filters
  Map<String, dynamic>? _appliedFilters; // Store applied filters here

  // Function called by FilterComponent when filters are applied or reset
  void _applyFiltersFromDrawer(Map<String, dynamic>? filters) {
    setState(() {
      if (filters == null) {
        // Reset case (null passed from FilterComponent's Reset button)
        _appliedFilters = null; // Clear applied filters
        print("Filters Reset via Drawer.");
      } else {
        // Apply case
        _appliedFilters = filters;
        print("Filters applied from drawer: $_appliedFilters");
      }
      // --- TODO: Apply Filter Logic ---
      // Add logic here to filter the data used in GridViews
      // based on the values in `_appliedFilters`.
      // This part is the same as before, needs actual implementation.
      // Example: filterCampaigns(); filterArtists();
      // --- End TODO ---
    });
  }

  @override
  Widget build(BuildContext context) {
    // --- Data Filtering Logic (Example - Replace with real logic) ---
    List<Map<String, dynamic>> filteredCampaigns =
        List.generate(4, (index) {
          return {
            /* ... dummy campaign data ... */
            'imagePath': 'assets/Baju.jpg',
            'campaignName': 'Campaign ${index + 1}',
            'createdTime': 'Created ${5 * (index + 1)}m ago',
            'status': index % 2 == 0 ? 'On Going' : 'Done',
          };
        }).where((campaign) {
          if (selectedIndex == 1) return campaign['status'] == 'On Going';
          if (selectedIndex == 2) return campaign['status'] == 'Done';
          return true; // selectedIndex == 0 (All)
        }).toList();

    List<Map<String, dynamic>> filteredArtists =
        List.generate(4, (index) {
          return {
            /* ... dummy artist data ... */
            'imagePath': 'assets/Baju.jpg',
            'nama': 'Nama Creator ${index + 1}',
            'lokasi': 'Jakarta',
            'igFollowers': '22.${index + 1} M',
            'ytFollowers': '12.${index + 8} M',
            'rating': 5.0 - (index * 0.1),
            'harga': 'Start from Rp. ${1.2 + index * 0.5} M',
            'category':
                index % 3 == 0
                    ? 'Fashion & Textile'
                    : (index % 3 == 1 ? 'Culinary' : 'Beauty'),
            'platform': index % 2 == 0 ? 'Instagram' : 'Youtube',
          };
        }).where((artist) {
          bool passSort = true; // Implement sorting later if needed
          // Di dalam filteredArtists di HomePage:
          bool passCategory =
              _appliedFilters == null ||
              _appliedFilters?['category'] == null ||
              _appliedFilters?['category'] == artist['category'];
          bool passPlatform =
              _appliedFilters == null ||
              _appliedFilters?['platform'] == null ||
              _appliedFilters?['platform'] == artist['platform'];
          return passSort && passCategory && passPlatform;
        }).toList();
    // --- End Data Filtering Logic ---

    return Scaffold(
      backgroundColor: Colors.grey[100],
      // --- Add the endDrawer property ---
      endDrawer: SizedBox(
        // Wrap FilterComponent in SizedBox to control width
        width:
            MediaQuery.of(context).size.width *
            0.8, // Set width (e.g., 80% of screen)
        child: FilterComponent(
          onApplyFilters: _applyFiltersFromDrawer, // Pass the callback function
          initialFilters: _appliedFilters,
          // You could also pass initial filters if needed:
          // initialFilters: _appliedFilters,
        ),
      ),
      // --- End endDrawer ---
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==== HEADER ====
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman ProfileOwnerPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileOwnerPage(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      /* ... Avatar ... */
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/profile_placeholder.png',
                      ),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      /* ... Welcome Text ... */
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
                    /* ... Notification Icon ... */
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
                      Icons.notifications_none,
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
                      /* ... Search Field ... */
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        hintText: "Search campaign or favorite artist",
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue.shade300),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // --- Filter Icon Button ---
                  Builder(
                    // Use Builder to get context for Scaffold.of
                    builder:
                        (context) => InkWell(
                          onTap: () {
                            Scaffold.of(
                              context,
                            ).openEndDrawer(); // Open the end drawer
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            /* ... Filter Icon Container ... */
                            decoration: BoxDecoration(
                              color: const Color(0xFF6A60DA),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(14),
                            child: const Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            ),
                          ),
                        ),
                  ),
                  // --- End Filter Icon Button ---
                ],
              ),

              const SizedBox(height: 24),

              // ==== Create Campaign Banner ====
              GestureDetector(
                /* ... Create Campaign Banner ... */
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateCampaignPage(),
                      ),
                    ),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3E54AC), Color(0xFF655DBB)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
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
                            SizedBox(height: 5),
                            Text(
                              "Click here to start your own campaign",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),

              // ==== Traffic Container ====
              Container(
                /* ... Traffic Container ... */
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Traffic",
                      style: TextStyle(
                        color: Color(0xFF3E54AC),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: const [
                        Text(
                          "327",
                          style: TextStyle(
                            color: Color(0xff51556B),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
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

              // ==== Recent Campaign Section ====
              const Padding(
                /* ... Recent Campaign Title ... */
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Recent Campaign",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              // === Filter Buttons (All, On Going, Done) ===
              Row(
                /* ... All/On Going/Done Buttons ... */
                children: List.generate(3, (index) {
                  final isSelected = selectedIndex == index;
                  final labels = ['All', 'On Going', 'Done'];
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () => setState(() => selectedIndex = index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isSelected
                                  ? const Color(0xFF3E54AC)
                                  : Colors.white,
                          foregroundColor:
                              isSelected
                                  ? Colors.white
                                  : const Color(0xFF3E54AC),
                          elevation: isSelected ? 2 : 0,
                          side:
                              isSelected
                                  ? BorderSide.none
                                  : const BorderSide(color: Color(0xFF3E54AC)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          labels[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // ==== Campaign GridView ====
              GridView.builder(
                /* ... Campaign GridView using filteredCampaigns ... */
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: filteredCampaigns.length,
                itemBuilder: (context, index) {
                  final campaign = filteredCampaigns[index];
                  return GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const CampaignDetailPage(currentStep: 2),
                          ),
                        ),
                    child: CampaignCard(
                      imagePath: campaign['imagePath']!,
                      campaignName: campaign['campaignName']!,
                      createdTime: campaign['createdTime']!,
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // ==== Artist/Creator Section Title ====
              const Padding(
                /* ... Explore Creators Title ... */
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Explore Creators",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              // ==== Artist/Creator GridView ====
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
