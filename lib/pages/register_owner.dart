import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterOwner extends StatefulWidget {
  const RegisterOwner({super.key});

  @override
  State<RegisterOwner> createState() => _RegisterOwnerState();
}

class _RegisterOwnerState extends State<RegisterOwner> {
  String selectedRole = 'owner';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String? phoneNumber;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3E54AC),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Enter your email and password to login",
                  style: TextStyle(color: Color(0xff9C9C9C), fontSize: 13),
                ),
                const SizedBox(height: 30),

                // Role selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildRoleButton("I'm Business Owner", 'owner'),
                    const SizedBox(width: 6),
                    _buildRoleButton("I'm Creator", 'creator'),
                  ],
                ),

                const SizedBox(height: 35),
                _buildTextField("Full Name*", "John Doe", nameController),
                const SizedBox(height: 15),
                _buildEmailField("Email*", "john@gmail.com", emailController),
                const SizedBox(height: 15),

                // Phone number
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number*',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                IntlPhoneField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Type your phone number',
                    hintStyle: const TextStyle(color: Color(0xffDDDADA)),
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  dropdownIconPosition: IconPosition.trailing,
                  initialCountryCode: 'ID',
                  style: const TextStyle(fontSize: 14),
                  onChanged: (phone) {
                    phoneNumber = phone.completeNumber;
                  },
                ),

                const SizedBox(height: 15),
                _buildPasswordField(
                  "Password*",
                  passwordController,
                  _obscurePassword,
                  () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                const SizedBox(height: 15),
                _buildConfirmPasswordField(
                  "Confirmation Password*",
                  confirmPasswordController,
                  _obscureConfirmPassword,
                  () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),

                const SizedBox(height: 30),

                // Create account button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E54AC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (phoneNumber == null || phoneNumber!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Phone number must be filled.'),
                            ),
                          );
                          return;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account created successfully!'),
                          ),
                        );

                        // Navigasi ke halaman Home dan hapus semua halaman sebelumnya
                        Future.delayed(const Duration(milliseconds: 500), () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (route) => false,
                          );
                        });
                      }
                    },
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Kembali ke login
                      },
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff3E54AC),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(String text, String role) {
    final isSelected = selectedRole == role;
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedRole = role;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? const Color(0xff3E54AC) : const Color(0xffE7EEF6),
          foregroundColor: isSelected ? Colors.white : const Color(0xff9C9C9C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(text, textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xffDDDADA)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Invalid email format';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xffDDDADA)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(
    String label,
    TextEditingController controller,
    bool obscureText,
    VoidCallback toggleVisibility,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: '************',
            hintStyle: const TextStyle(color: Color(0xffDDDADA)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xff9C9C9C),
              ),
              onPressed: toggleVisibility,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField(
    String label,
    TextEditingController controller,
    bool obscureText,
    VoidCallback toggleVisibility,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            if (value != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: '************',
            hintStyle: const TextStyle(color: Color(0xffDDDADA)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xff9C9C9C),
              ),
              onPressed: toggleVisibility,
            ),
          ),
        ),
      ],
    );
  }
}
