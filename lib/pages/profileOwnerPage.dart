import 'package:flutter/material.dart';
import '../components/ownerProfileCard.dart'; // Ganti sesuai lokasi file kamu

class ProfileOwnerPage extends StatefulWidget {
  const ProfileOwnerPage({super.key});

  @override
  _ProfileOwnerPageState createState() => _ProfileOwnerPageState();
}

class _ProfileOwnerPageState extends State<ProfileOwnerPage> {
  bool _isEditing = false;
  bool _obscurePasswordField = true; // state untuk toggle mata

  // Kontrol untuk form input
  final TextEditingController _nameController = TextEditingController(
    text: "Lorem ipsum...",
  );
  final TextEditingController _dobController = TextEditingController(
    text: "Jakarta, August 21st, 1995",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "Lorem ipsum...",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "Lorem ipsum...",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "8**21",
  );
  final TextEditingController _passwordController = TextEditingController(
    text: "A**1",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ProfileCard(),

              const SizedBox(height: 16),
              const Text(
                "PROFILE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Card putih untuk form
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tombol Edit / Save
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(_isEditing ? Icons.check : Icons.edit),
                          onPressed: () {
                            setState(() => _isEditing = !_isEditing);
                          },
                        ),
                      ),

                      // Field biasa
                      _buildTextField(
                        controller: _nameController,
                        label: "Full Name",
                        hint: "Lorem ipsum...",
                        enabled: _isEditing,
                      ),
                      _buildTextField(
                        controller: _dobController,
                        label: "Place and Date of Birth",
                        hint: "Jakarta, August 21st, 1995",
                        enabled: _isEditing,
                      ),
                      _buildTextField(
                        controller: _addressController,
                        label: "Address",
                        hint: "Lorem ipsum...",
                        enabled: _isEditing,
                      ),
                      _buildTextField(
                        controller: _emailController,
                        label: "Email",
                        hint: "Lorem ipsum...",
                        enabled: _isEditing,
                      ),
                      _buildPhoneField(enabled: _isEditing),

                      // Password dengan toggle
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Password"),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _passwordController,
                              obscureText: _obscurePasswordField,
                              enabled: _isEditing,
                              decoration: InputDecoration(
                                hintText: "A**1",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePasswordField
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () =>
                                          _obscurePasswordField =
                                              !_obscurePasswordField,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  /* log out */
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.deepPurple),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscure = false,
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            obscureText: obscure,
            enabled: enabled,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon:
                  obscure
                      ? IconButton(
                        icon: Icon(
                          _obscurePasswordField
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(
                            () =>
                                _obscurePasswordField = !_obscurePasswordField,
                          );
                        },
                      )
                      : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField({bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Phone Number"),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("+62"),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _phoneController,
                  enabled: enabled,
                  decoration: InputDecoration(
                    hintText: "8**21",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
