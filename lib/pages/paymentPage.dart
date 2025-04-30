import 'package:flutter/material.dart';
import '../components/briefCard.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../pages/campaignDetail.dart';
// pastikan kamu ada file ini

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedBank = 'BCA';
  File? paymentProofFile;

  final Map<String, Map<String, String>> bankDetails = {
    'BCA': {'accountNumber': '08412345642', 'accountName': 'PT Contoh Nama'},
    'Mandiri': {
      'accountNumber': '1400001234567',
      'accountName': 'PT Mandiri Sejahtera',
    },
    'BNI': {'accountNumber': '02123456789', 'accountName': 'PT BNI Indonesia'},
  };

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        paymentProofFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final campaign = Campaign(
      title: 'Campaign 1',
      productName: 'Product 1',
      category: 'Category 1',
      platform: 'Platform 1',
      price: '1000',
      campaignPeriod: '2025-01-01 to 2025-02-01',
      imagePath: 'assets/Baju.jpg',
      campaignDate: DateTime.now(),
    );

    final bankInfo = bankDetails[selectedBank]!;

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BriefCard(campaign: campaign),
              const SizedBox(height: 20),

              // Bank dropdown
              const Text('Choose Payment Option'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedBank,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items:
                    bankDetails.keys.map((String bank) {
                      return DropdownMenuItem<String>(
                        value: bank,
                        child: Text(bank),
                      );
                    }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedBank = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 20),

              // Bank Details
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Please make the payment by transfer to the account number provided.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('Campaign Name: ${campaign.title}'),
                    Text(
                      'Bank Account: $selectedBank | ${bankInfo['accountName']}',
                    ),
                    Text(
                      'Account Number: ${_maskAccountNumber(bankInfo['accountNumber']!)}',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // QR Image
              const Text('or Scan by QRIS'),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/default_qr.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              // Upload Proof
              const Text('Send your payment confirmation here'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: pickFile,
                child: DottedBorderBox(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.upload_file,
                        size: 40,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 8),
                      const Text('Upload your file here'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: pickFile,
                        child: const Text('Browse files'),
                      ),
                      if (paymentProofFile != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            '${paymentProofFile!.path.split('/').last} (${(paymentProofFile!.lengthSync() / 1024).toStringAsFixed(1)} KB)',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Please wait for the creator\'s confirmation to proceed to the next step.\n\nYou may close this window and check later.',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed:
                    paymentProofFile == null
                        ? null
                        : () async {
                          // Tampilkan loading + ceklis animasi
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder:
                                (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 48,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'Your payment has been received!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Please wait for verification.',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                          );

                          await Future.delayed(const Duration(seconds: 2));

                          if (context.mounted) {
                            Navigator.of(context).pop(); // Close dialog
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => const CampaignDetailPage(
                                      currentStep: 5,
                                    ),
                              ),
                            );
                          }
                        },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                  backgroundColor:
                      paymentProofFile == null ? Colors.grey : Colors.blue,
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _maskAccountNumber(String number) {
    if (number.length <= 4) return number;
    return number.replaceRange(3, number.length - 2, '*' * (number.length - 5));
  }
}

class DottedBorderBox extends StatelessWidget {
  final Widget child;
  const DottedBorderBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
          style: BorderStyle.solid,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
