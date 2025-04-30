import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cobacoba/pages/findCreator.dart'; // Sesuaikan dengan path sebenarnya

class AIGeneratePage extends StatefulWidget {
  const AIGeneratePage({super.key});

  @override
  State<AIGeneratePage> createState() => _AIGeneratePageState();
}

class _AIGeneratePageState extends State<AIGeneratePage> {
  bool isEditable = false;
  bool isUpdated = false; // Flag to track if the content has been updated
  final TextEditingController _controllerCampaign = TextEditingController();
  final TextEditingController _controllerImportantNote =
      TextEditingController();
  @override
  void dispose() {
    _controllerCampaign.dispose();
    _controllerImportantNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMM yyyy – HH:mm').format(now);

    return Scaffold(
      appBar: AppBar(title: const Text("Brief Insight")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CARD Healthy Snack Promo
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Baris atas: Gambar & info
                    Row(
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
                              const Text(
                                "Healthy Snack Promo",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                formattedDate,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const InfoRow(
                                label: "Product Name",
                                value: "Organic Granola",
                              ),
                              const InfoRow(
                                label: "Category",
                                value: "Food & Beverage",
                              ),
                              const InfoRow(
                                label: "Platform",
                                value: "Instagram",
                              ),
                              const InfoRow(label: "Price", value: "Rp500.000"),
                              const InfoRow(
                                label: "Campaign Period",
                                value: "1 May - 15 May 2025",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // BRIEF BACKGROUND Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF3E54AC), // biru
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Brief Background",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Campaign Description
              const Text(
                "Campaign Description",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerCampaign,
                      readOnly: !isEditable,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Enter text...",
                        hintStyle: TextStyle(fontSize: 12),
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          isEditable ? Icons.check : Icons.edit,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            isEditable = !isEditable;
                            isUpdated = true; // Mark as updated
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              const Text(
                "AI Sugesstion",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // AI Suggestion Section with Dotted Border
              DottedBorder(
                color: Colors.blueAccent, // Border color
                strokeWidth: 2, // Line thickness
                dashPattern: [6, 3], // Length of dash and gap
                borderType: BorderType.RRect, // Rounded border
                radius: Radius.circular(12), // Border radius
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E7FF), // Light purple background
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sample Output
                      Text(
                        "", // <-- Nanti isi dari AI
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "", // <-- Nanti isi dari AI
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Important Note
              const Text(
                "Important Note",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerImportantNote,
                      readOnly: !isEditable,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Enter text...",
                        hintStyle: TextStyle(fontSize: 12),
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          isEditable ? Icons.check : Icons.edit,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            isEditable = !isEditable;
                            isUpdated = true; // Mark as updated
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              const Text(
                "AI Sugesstion",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // AI Suggestion Section with Dotted Border
              DottedBorder(
                color: Colors.blueAccent, // Border color
                strokeWidth: 2, // Line thickness
                dashPattern: [6, 3], // Length of dash and gap
                borderType: BorderType.RRect, // Rounded border
                radius: Radius.circular(12), // Border radius
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E7FF), // Light purple background
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sample Output
                      Text(
                        "", // <-- Nanti isi dari AI
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "", // <-- Nanti isi dari AI
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Update and Submit Buttons
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Update Button
                  ElevatedButton(
                    onPressed:
                        isUpdated
                            ? () {
                              // Handle update action here
                            }
                            : null, // Disabled if no updates
                    child: const Text('Update'),
                  ),
                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Pindah ke halaman FindCreator
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindCreator()),
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              const Text(
                "Note: If there are any changes, click 'Update' to generate the AI suggestion again.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Text(
                  ":",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
