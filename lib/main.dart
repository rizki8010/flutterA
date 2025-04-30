// import 'package:flutter/material.dart';
// import 'package:cobacoba/pages/campaignDetail.dart'; // (kalau kamu pisahkan ke file lain)
// import 'package:cobacoba/pages/creatorPrice.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CampaignDetailPage(
//         currentStep: 2,
//       ), // <<< Ganti dengan nilai default (misal 2)
//     ),
//   );
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Creator Detail',
//       theme: ThemeData(primarySwatch: Colors.deepPurple),
//       home: const CombinedPage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cobacoba/pages/home.dart';
import 'package:cobacoba/pages/splash_screen.dart';
import 'package:cobacoba/pages/paymentPage.dart';
import 'package:cobacoba/pages/register_owner.dart';
import 'package:cobacoba/pages/login_owner.dart';
import 'package:cobacoba/pages/onboarding.dart';
import 'package:cobacoba/pages/contractSigning.dart'; // pastikan import onboarding

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // ubah jadi SplashScreen
      routes: {
        '/onboarding': (context) => const OnboardingPage(), // tambahkan ini
        '/home': (context) => HomePage(),
        '/payment': (context) => const PaymentPage(),
        '/login-owner': (context) => const LoginOwner(),
        '/register-owner': (context) => const RegisterOwner(),
        '/contractSigning': (context) => ContractSigning(), // Halaman kontrak
      },
    );
  }
}
