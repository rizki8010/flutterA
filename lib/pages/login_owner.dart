import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cobacoba/pages/register_owner.dart'; // Sesuaikan dengan path jika ada folder

class LoginOwner extends StatefulWidget {
  const LoginOwner({super.key});

  @override
  State<LoginOwner> createState() => _LoginOwnerState();
}

class _LoginOwnerState extends State<LoginOwner> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedRole = 'owner';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Form(
            key: _formKey, // wrap with Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                const Text(
                  "Get Started Now",
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

                // Role button (sama seperti sebelumnya)...
                const SizedBox(height: 40),

                // Email Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email", style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email wajib diisi';
                        }
                        if (!value.contains('@')) {
                          return 'Format email tidak valid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'type your email',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Password", style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password wajib diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'type your password',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Forgot Password (same)...
                const SizedBox(height: 30),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Tampilkan snackbar saat login dimulai
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logging in...')),
                        );

                        // Navigasi ke halaman Home
                        Future.delayed(const Duration(milliseconds: 500), () {
                          Navigator.pushNamed(context, '/home');
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3E54AC),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Pembatas SVG (pakai garis sebagai alternatif kalau SVG tidak tersedia)
                const Row(
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or"),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  ],
                ),
                // Google Login Button
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: const Color(0xffF5F7FF),
                      foregroundColor: const Color(0xff3E54AC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Color(0xff3E54AC)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/cobacoba/devicon_google.svg',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Google Account',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account? ',
                      style: TextStyle(fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterOwner(),
                          ),
                        );
                      },

                      child: const Text(
                        'Create an account',
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
}
