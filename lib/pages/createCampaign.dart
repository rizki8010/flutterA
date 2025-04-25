import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'aiGenerate.dart'; // Pastikan ini adalah halaman yang ingin dituju setelah submit

class CreateCampaignPage extends StatefulWidget {
  const CreateCampaignPage({Key? key}) : super(key: key);

  @override
  State<CreateCampaignPage> createState() => _CreateCampaignPageState();
}

class _CreateCampaignPageState extends State<CreateCampaignPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _campaignNameController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _campaingGoalController = TextEditingController();
  final TextEditingController _importantNoteController =
      TextEditingController();

  String? _selectedCategory;
  String? _selectedPrice;
  String? _selectedPlatform;
  DateTime? _startDate;
  DateTime? _endDate;
  File? _selectedImage;

  final List<String> _categories = ['Electronics', 'Fashion', 'Food', 'Books'];
  final List<String> _prices = [
    '< Rp. 1 jt',
    'Rp. 1 jt - Rp. 5 jt',
    'Rp. 5 jt - Rp. 10 jt',
    '> Rp. 10 jt',
  ];
  final List<String> _platforms = ['Instagram', 'TikTok', 'YouTube', 'Twitter'];

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simpan data form dan lakukan navigasi
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AIGeneratePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Campaign Form")),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ), // Add padding here
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Section: Basic Info ---
                  const Text(
                    'Campaign Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _campaignNameController,
                    decoration: const InputDecoration(
                      hintText: 'Type here...',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Nama campaign tidak boleh kosong'
                                : null,
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Product Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _productNameController,
                    decoration: const InputDecoration(
                      hintText: 'Type here...',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Nama produk tidak boleh kosong'
                                : null,
                  ),

                  // --- Section: Category & Price ---
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: _selectedCategory,
                              hint: const Text("Select category"),
                              items:
                                  _categories
                                      .map(
                                        (value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        ),
                                      )
                                      .toList(),
                              onChanged:
                                  (value) =>
                                      setState(() => _selectedCategory = value),
                              validator:
                                  (value) =>
                                      value == null
                                          ? 'Kategori wajib dipilih'
                                          : null,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ), // Jarak horizontal antara dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: _selectedPrice,
                              hint: const Text("Select price"),
                              items:
                                  _prices
                                      .map(
                                        (value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        ),
                                      )
                                      .toList(),
                              onChanged:
                                  (value) =>
                                      setState(() => _selectedPrice = value),
                              validator:
                                  (value) =>
                                      value == null
                                          ? 'Harga wajib dipilih'
                                          : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // --- Section: Platform ---
                  const SizedBox(height: 16),
                  const Text(
                    'Platform',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedPlatform,
                    hint: const Text("Select platform"),
                    items:
                        _platforms
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                    onChanged:
                        (value) => setState(() => _selectedPlatform = value),
                    validator:
                        (value) =>
                            value == null ? 'Platform wajib dipilih' : null,
                  ),

                  // --- Section: Date Picker ---
                  const SizedBox(height: 16),
                  const Text(
                    'Campaign Period',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) setState(() => _startDate = date);
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Start Date',
                            ),
                            child: Text(
                              _startDate != null
                                  ? _startDate!.toLocal().toString().split(
                                    ' ',
                                  )[0]
                                  : 'Select start date',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) setState(() => _endDate = date);
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'End Date',
                            ),
                            child: Text(
                              _endDate != null
                                  ? _endDate!.toLocal().toString().split(' ')[0]
                                  : 'Select end date',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // --- Section: Upload Gambar ---
                  const SizedBox(height: 16),
                  const Text(
                    'Upload Image',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.image),
                    label: const Text("Select Image"),
                  ),
                  if (_selectedImage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Image.file(_selectedImage!, height: 100),
                    ),

                  // --- Section: Description, Goal, Note ---
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Type here...',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Deskripsi tidak boleh kosong'
                                : null,
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    'Campaign Goal',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _campaingGoalController,
                    decoration: const InputDecoration(
                      hintText: 'Type here...',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Goal tidak boleh kosong'
                                : null,
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    'Important Notes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _importantNoteController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Type here...',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Important Notes tidak boleh kosong'
                                : null,
                  ),

                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text("Submit Campaign"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50), // Full width
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
