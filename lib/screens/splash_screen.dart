import 'package:flutter/material.dart';
import 'package:intro_slider/helper/global.dart';
import 'package:intro_slider/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 10),
      () {
        _showOnboardingScreens();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Getting device size
    screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors
              .indigo, // To see the difference between the image's original size and the frame
          height: screenSize.height,
          width: screenSize.width,
          // Uploading the Image from Assets
          child: Image.asset(
            'assets/images/bg2.jpg',

            // Resizing the Image to the Frame Size
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _showOnboardingScreens() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const OnboardingScreen(),
      ),
    );
  }
}
