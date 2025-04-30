import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import '../components/briefCardfinal.dart';
import 'paymentPage.dart';

class ContractSigning extends StatefulWidget {
  const ContractSigning({Key? key}) : super(key: key);

  @override
  State<ContractSigning> createState() => _ContractSigningState();
}

class _ContractSigningState extends State<ContractSigning> {
  File? selectedFile;
  bool isChecked = false;

  // Dummy data
  final List<Campaign> campaigns = [
    Campaign(
      title: 'Campaign 1',
      artist: 'Wonyoung',
      productName: 'Product 1',
      category: 'Category 1',
      platform: 'Platform 1',
      price: '1000',
      campaignPeriod: '2025-01-01 to 2025-02-01',
      imagePath: 'assets/Baju.jpg',
      campaignDate: DateTime.now(),
    ),
  ];

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  void _openAgreement() async {
    // Open the local asset file
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/agreement.pdf';
    final agreementFile = File(filePath);

    if (!await agreementFile.exists()) {
      final byteData = await rootBundle.load('assets/file/agreement.pdf');
      final bytes = byteData.buffer.asUint8List();
      await agreementFile.writeAsBytes(bytes);
    }

    OpenFile.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    final bool canSubmit = selectedFile != null && isChecked;

    return Scaffold(
      appBar: AppBar(title: const Text('Contract Signing')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campaign Brief Cards
            Column(
              children: campaigns.map((c) => BriefCard(campaign: c)).toList(),
            ),
            const SizedBox(height: 24),

            // Title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: const Color(0xFF6C63FF),
              child: const Text(
                'Brand and Creator must sign the stamped agreement under the specified terms to prevent future issues.',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Download section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Download the document here.'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Agreement.pdf',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _openAgreement,
                  icon: const Icon(Icons.download),
                  label: const Text("Download"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Upload section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upload the contract that applied your digital signature.',
              ),
            ),
            const SizedBox(height: 12),
            DottedBorder(
              color: Colors.blueAccent,
              strokeWidth: 1.5,
              radius: const Radius.circular(12),
              dashPattern: const [6, 3],
              borderType: BorderType.RRect,
              child: InkWell(
                onTap: _pickFile,
                child: Container(
                  width: double.infinity,
                  height: 160,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.upload_file, size: 40, color: Colors.blue),
                      SizedBox(height: 8),
                      Text('Upload your file here'),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: null,
                        child: Text('Browse files'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // File preview
            if (selectedFile != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        selectedFile!.path.split('/').last,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('1 MB'),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          selectedFile = null;
                        });
                      },
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 16),

            // Valid message
            if (selectedFile != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.info, color: Colors.blue),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Your document is valid. You may submit it and proceed to the next step.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 16),

            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged:
                      selectedFile != null
                          ? (val) {
                            setState(() {
                              isChecked = val ?? false;
                            });
                          }
                          : null,
                ),
                const Expanded(
                  child: Text("I agree to the terms and conditions."),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    canSubmit
                        ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentPage(),
                            ),
                          );
                        }
                        : null,

                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  disabledBackgroundColor: Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
