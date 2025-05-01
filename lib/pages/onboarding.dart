import 'package:flutter/material.dart';
import 'package:cobacoba/pages/login_owner.dart'; // Pastikan import ini
import 'package:cobacoba/pages/register_owner.dart'; // Pastikan import ini

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3E54AC), Color(0xFF655DBB), Color(0xFF192246)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'AiDorse',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Let’s Collaborate",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Your smart companion to help you find the right collaborator, anywhere you go.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white60),
                  ),
                  const SizedBox(height: 32),

                  _featureCard(
                    icon: Icons.campaign_rounded,
                    title: 'Campaign',
                    description:
                        'Easily create a campaign or contribute to one effortlessly!',
                  ),
                  const SizedBox(height: 16),
                  _featureCard(
                    icon: Icons.groups_2_rounded,
                    title: 'Influencer Recommendation',
                    description:
                        'Find the perfect influencer to elevate your campaign',
                  ),
                  const SizedBox(height: 16),
                  _featureCard(
                    icon: Icons.description_rounded,
                    title: 'Brief',
                    description:
                        'Create a brief and get AI-powered suggestions to enhance your ideas',
                  ),
                  const SizedBox(height: 32),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login-owner');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF0D153A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register-owner');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text.rich(
                    TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: TextStyle(fontSize: 12, color: Colors.white54),
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(text: '. Learn how we use your data in our '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF8B88CC).withOpacity(0.6),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(icon, color: Color(0xFF3E54AC)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
