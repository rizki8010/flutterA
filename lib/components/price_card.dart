import 'package:flutter/material.dart';

class PriceCard extends StatefulWidget {
  final String title;
  final List<String> features;
  final String price;
  final Function(bool, String)
  onSelected; // Callback untuk status dan harga yang dipilih

  const PriceCard({
    Key? key,
    required this.title,
    required this.features,
    required this.price,
    required this.onSelected, // Menerima callback
  }) : super(key: key);

  @override
  _PriceCardState createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  bool _isSelected = false;

  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onSelected(
      _isSelected,
      widget.price,
    ); // Kirim status dan harga ke parent
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: _isSelected ? const Color(0xFFE0D7F8) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            ...widget.features.map(
              (feature) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Tombol tidak melakukan aksi apapun
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                backgroundColor: const Color(0xFF3E54AC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 18,
                color: Colors.white,
              ),
              label: Text(
                widget.price,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
