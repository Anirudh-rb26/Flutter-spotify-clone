import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/core/configs/assets/app_assets/app_vectors.dart';
import 'package:spotifyclone/presentation/introduction%20screens/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.vectorAppLogo),
      ),
    );
  }

  Future<void> redirect() async {
    // Delay SplashScreen
    await Future.delayed(const Duration(seconds: 2));

    // Navigate to GetStarted Page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const GetStartedScreen()),
    );
  }
}
