import 'package:cobacoba/pages/contractSigning.dart';
import 'package:flutter/material.dart';
import 'package:cobacoba/pages/findCreator.dart'; // Import halaman FindCreator
import 'package:cobacoba/pages/paymentPage.dart'; // Import halaman Payment
import 'package:cobacoba/pages/doneUpload.dart'; // Import halaman DoneUpload

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CampaignDetailPage(
        currentStep: 2, // Misal dari database nanti
      ),
    ),
  );
}

class CampaignDetailPage extends StatefulWidget {
  final int currentStep;
  const CampaignDetailPage({super.key, required this.currentStep});

  @override
  _CampaignDetailPageState createState() => _CampaignDetailPageState();
}

class _CampaignDetailPageState extends State<CampaignDetailPage> {
  late int currentStep;

  @override
  void initState() {
    super.initState();
    currentStep =
        widget
            .currentStep; // Menyimpan nilai currentStep yang diterima dari konstruktor
  }

  void _navigateToPage(int stepIndex) {
    // Navigasi berdasarkan stepIndex
    if (stepIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FindCreator()),
      );
    } else if (stepIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ContractSigning()),
      );
    } else if (stepIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PaymentPage()),
      );
    } else if (stepIndex == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DoneUploadPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Campaign Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CAMPAIGN PROGRESS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            _buildProgressSection(),
            const SizedBox(height: 20),
            const Text(
              'CAMPAIGN DESCRIPTION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            _buildCampaignDescription(),
            const SizedBox(height: 20),
            _buildProductDescription(),
            const SizedBox(height: 20),
            _buildContentOverview(),
            const SizedBox(height: 20),
            // Di dalam Widget build -> Column -> children:
            _buildContentLink(),
            if (currentStep >= 5) _buildReviewSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    List<String> steps = [
      'Create\nBrief',
      'Find\nCreator',
      'Contract\nSigning',
      'Payment',
      'Upload',
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigasi berdasarkan currentStep
              if (currentStep == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FindCreator()),
                );
              } else if (currentStep == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                );
              } else if (currentStep == 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoneUploadPage(),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4C6EF5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: const Text(
              'Your Recent Progress >',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(steps.length * 2 - 1, (index) {
              if (index.isOdd) {
                return _buildLine();
              } else {
                int stepIndex = index ~/ 2;
                Color stepColor;
                IconData iconData;

                // Cek jika currentStep >= 5, maka semua langkah biru
                if (currentStep >= 5 || stepIndex < currentStep) {
                  stepColor = Colors.blue;
                  iconData = Icons.check_circle;
                } else if (stepIndex == currentStep) {
                  stepColor = Colors.red;
                  iconData = Icons.error;
                } else {
                  stepColor = Colors.grey;
                  iconData = Icons.circle_outlined;
                }

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentStep = stepIndex;
                    });
                    _navigateToPage(
                      stepIndex,
                    ); // Pindah halaman sesuai dengan step
                  },
                  child: _buildStep(
                    icon: iconData,
                    label: steps[stepIndex],
                    color: stepColor,
                    stepIndex: stepIndex,
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required IconData icon,
    required String label,
    required Color color,
    required int stepIndex,
  }) {
    return GestureDetector(
      onTap: () {
        // Memperbarui currentStep dan navigasi jika langkah sudah bisa dicapai
        if (stepIndex <= currentStep) {
          setState(() {
            currentStep = stepIndex;
          });
          _navigateToPage(stepIndex);
        }
      },
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return const Expanded(child: Divider(color: Colors.grey, thickness: 1));
  }

  Widget _buildCampaignDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/Baju.jpg',
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
                Row(
                  children: const [
                    Icon(Icons.campaign, size: 20, color: Colors.black),
                    SizedBox(width: 6),
                    Text(
                      'Campaign Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Creator Name',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                const Text(
                  '10 Feb 2025, 22:14 PM',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAlignedDetailRow('Product', 'Lorem ipsum dolor'),
                      _buildAlignedDetailRow('Creator', 'Lorem ipsum dolor'),
                      _buildAlignedDetailRow('Platform', 'Instagram'),
                      _buildAlignedDetailRow('Price', 'Rp 42.000.000,-'),
                      _buildAlignedDetailRow(
                        'Campaign Period',
                        '21 Aug 2024 - 21 Sep 2024',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlignedDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product Description',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return Image.asset(
                        'assets/Baju.jpg',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras faucibus dapibus nibh, sed commodo erat.',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 8),
                const Text('Product Quantity: 1'),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Category: '),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF6C63FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Fashion & Textile',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Content Overview',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Brief'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Storyline'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContentLink() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Content Link',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Link'),
            onTap: () {
              // Implementasi open link nanti
            },
          ),
        ),
      ],
    );
  }

  // Tambahkan variabel state untuk rating bintang
  int _selectedStars = 0;

  // Tambahkan widget ini di dalam class _CampaignDetailPageState
  Widget _buildReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Review This Campaign',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            children: [
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Write your review here...',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _selectedStars ? Icons.star : Icons.star_border,
                      color:
                          index < _selectedStars ? Colors.amber : Colors.grey,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedStars = index + 1;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit review
                    print('Review submitted: $_selectedStars stars');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Review submitted successfully!'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C6EF5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Send Review',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
