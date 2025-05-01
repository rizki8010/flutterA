// lib/components/filter_component.dart
import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  // Callback function to pass selected filters back to HomePage
  final Function(Map<String, dynamic>?) onApplyFilters;
  final Map<String, dynamic>? initialFilters; // Optional: Pass current filters

  const FilterComponent({
    super.key,
    required this.onApplyFilters, // Make callback required
    this.initialFilters,
  });

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  // --- State Variables ---
  String? _selectedSortBy;
  String? _selectedCategory;
  String? _selectedPlatform;

  // --- Mock Data (Replace with your actual data sources) ---
  final List<String> _sortByOptions = ['All', 'Campaign', 'Name'];
  final List<String> _categoryOptions = [
    'All',
    'Agriculture & Plantation',
    'Beauty',
    'Culinary',
    'Crafts & Souvenirs',
    'Fashion & Textile',
    'Health',
    'Technology & Digital',
    'Lifestyle',
    'Entertainment',
    'Parenting',
    'Family',
    'Education',
    'Other',
  ];
  final List<String> _platformOptions = [
    'All',
    'Instagram',
    'Youtube',
    'Tiktok',
  ];
  // --- End Mock Data ---

  @override
  void initState() {
    super.initState();
    // Initialize state with passed initial values or defaults
    _selectedSortBy =
        widget.initialFilters?['sortBy'] ??
        (_sortByOptions.isNotEmpty ? _sortByOptions[0] : null);
    _selectedCategory =
        widget.initialFilters?['category'] ??
        (_categoryOptions.isNotEmpty ? _categoryOptions[0] : null);
    _selectedPlatform =
        widget.initialFilters?['platform'] ??
        (_platformOptions.isNotEmpty ? _platformOptions[0] : null);
  }

  // Function to reset local state to defaults
  // Di dalam _resetLocalFilters di FilterComponent:
  void _resetLocalFilters() {
    setState(() {
      _selectedSortBy = 'All';
      _selectedCategory = 'All';
      _selectedPlatform = 'All';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define consistent styling
    final titleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.grey[800], // Darker grey
    );
    final optionStyle = TextStyle(fontSize: 14, color: Colors.grey[800]);
    const activeColor = Color(0xFF6A60DA); // Purple color from image

    return Drawer(
      // Use Drawer widget
      backgroundColor: Color(0xFFE7ECFF), // Clean white background for drawer
      elevation: 4.0, // Add some elevation
      child: SafeArea(
        // Ensure content respects safe areas
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20.0,
            20.0,
            20.0,
            10.0,
          ), // Adjust padding
          child: SingleChildScrollView(
            // Allow scrolling if content overflows
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Header ---
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    // Add close button
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Preferences',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed:
                            () => Navigator.pop(context), // Just close drawer
                        tooltip: 'Close',
                      ),
                    ],
                  ),
                ),

                // --- Reset All Button ---
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Reset All Filters'),
                    onPressed: () {
                      _resetLocalFilters(); // Reset local state first
                      print("Reset All clicked - Resetting filters");
                      // Pass null back to indicate reset and close drawer
                      widget.onApplyFilters(null);
                      Navigator.pop(context); // Close the drawer
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey[700],
                      side: BorderSide(color: Colors.grey[300]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 25), // Increased spacing
                // --- Sort By Section ---
                Text('Sort by', style: titleStyle),
                const SizedBox(height: 8),
                _buildRadioGroup<String>(
                  options: _sortByOptions,
                  groupValue: _selectedSortBy,
                  onChanged: (value) => setState(() => _selectedSortBy = value),
                  activeColor: activeColor,
                  optionStyle: optionStyle,
                ),
                const SizedBox(height: 25), // Increased spacing
                // --- Category Section ---
                Text('Category', style: titleStyle),
                const SizedBox(height: 8),
                _buildRadioGroup<String>(
                  options: _categoryOptions,
                  groupValue: _selectedCategory,
                  onChanged:
                      (value) => setState(() => _selectedCategory = value),
                  activeColor: activeColor,
                  optionStyle: optionStyle,
                ),
                const SizedBox(height: 25), // Increased spacing
                // --- Platform Section ---
                Text('Platform', style: titleStyle),
                const SizedBox(height: 8),
                _buildRadioGroup<String>(
                  options: _platformOptions,
                  groupValue: _selectedPlatform,
                  onChanged:
                      (value) => setState(() => _selectedPlatform = value),
                  activeColor: activeColor,
                  optionStyle: optionStyle,
                ),
                const SizedBox(height: 35), // Space before Apply button
                // --- Apply Button ---
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Apply the filters - pass data back to HomePage via callback
                      final selectedFilters = {
                        'sortBy':
                            _selectedSortBy == 'All' ? null : _selectedSortBy,
                        'category':
                            _selectedCategory == 'All'
                                ? null
                                : _selectedCategory,
                        'platform':
                            _selectedPlatform == 'All'
                                ? null
                                : _selectedPlatform,
                      };
                      print('Applying filters from drawer: $selectedFilters');
                      widget.onApplyFilters(
                        selectedFilters,
                      ); // Call the callback
                      Navigator.pop(context); // Close the drawer
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          activeColor, // Use consistent active color
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ), // Taller button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2.0,
                    ),
                    child: const Text(
                      'Apply Filters',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Padding at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget to build radio groups consistently
  Widget _buildRadioGroup<T>({
    required List<T> options,
    required T? groupValue,
    required ValueChanged<T?> onChanged,
    required Color activeColor,
    required TextStyle optionStyle,
  }) {
    // Use Wrap for better layout if many options exist horizontally
    // For vertical list, Column is fine
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:
          options.map((option) {
            return SizedBox(
              // Control height of each radio tile
              height: 40,
              child: RadioListTile<T>(
                title: Text(option.toString(), style: optionStyle),
                value: option,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: activeColor,
                contentPadding: EdgeInsets.zero, // Remove default padding
                visualDensity: const VisualDensity(
                  horizontal: 0,
                  vertical: -2,
                ), // Make denser
                controlAffinity:
                    ListTileControlAffinity.leading, // Radio button on left
              ),
            );
          }).toList(),
    );
  }
}
