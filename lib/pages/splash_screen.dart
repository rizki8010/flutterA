import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3E54AC), Color(0xFF655DBB), Color(0xFF192246)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Container untuk efek glow logo
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      blurRadius: 60,
                      spreadRadius: 10,
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/AiDorseLogo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Tulisan AiDorse di bawah logo
              const Text(
                'AiDorse',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const Spacer(flex: 3),

              // Footer di paling bawah
              const Padding(
                padding: EdgeInsets.only(bottom: 24, left: 32, right: 32),
                child: Text(
                  'AiDorse simplifies creator hiring with AI-driven recommendations, seamlessly matching businesses with the perfect creators for high-impact campaigns.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
