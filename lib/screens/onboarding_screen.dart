import 'package:flutter/material.dart';
import 'package:intro_slider/models/onboarding.dart';
import 'package:intro_slider/screens/home_screen.dart';
import 'package:intro_slider/helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List sliderData = prepareSliderData();
    PageController pageController = PageController();
    bool isLastPage = false; //Check if the last page is reached

    var pageView = PageView.builder(
      itemCount: sliderData.length,
      controller: pageController,
      itemBuilder: (ctx, pageIndex) {
        isLastPage = (pageIndex == sliderData.length - 1);
        return Column(
          children: [
            //adding Skip button
            if (pageIndex != 0)
              Padding(
                padding: EdgeInsets.only(
                    left: screenSize.width * 0.8,
                    top: screenSize.height * 0.02),
                child: TextButton(
                  onPressed: () {
                    moveToNextScreen(context);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      letterSpacing: .5,
                      fontSize: screenSize.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ),
            SizedBox(height: screenSize.height * 0.02),
            //Adding animation to the screen
            Padding(
              padding: EdgeInsets.only(right: screenSize.width * 0.01),
              child: Image.asset(
                sliderData[pageIndex].image,
                height: screenSize.height * .6,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              sliderData[pageIndex].title,
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: .5,
                fontSize: screenSize.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),

            //Adding title and paragraph
            Padding(
                padding: EdgeInsets.only(
                    left: screenSize.height * 0.01,
                    right: screenSize.height * 0.01),
                child: Text(
                  sliderData[pageIndex].subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: .5,
                    fontSize: screenSize.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                )),
            SizedBox(height: screenSize.height * 0.02),

            //Adding dots or indicators
            Wrap(
              spacing: screenSize.width * 0.02,
              children: List.generate(
                4,
                (listIndex) => Container(
                  width: listIndex == pageIndex
                      ? screenSize.width * 0.07
                      : screenSize.width * 0.05,
                  height: screenSize.height * 0.01,
                  decoration: BoxDecoration(
                    color: listIndex == pageIndex ? Colors.cyan : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),

            //Adding next button
            ElevatedButton(
              onPressed: () {
                if (isLastPage) {
                  moveToNextScreen(context);
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.1,
                    vertical: screenSize.height * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                isLastPage ? 'Get Start' : 'Next',
                style: TextStyle(
                  letterSpacing: .5,
                  fontSize: screenSize.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    return Scaffold(
      body: pageView,
    );
  }

  void moveToNextScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomeScreen(),
      ),
    );
  }

//Prepare data for IntroSlider
  List prepareSliderData() {
    return [
      Onboarding(
        title: 'Welcome to Your AI Companion',
        subtitle:
            'Simplify your life with a smart assistant designed to meet your daily needs effortlessly.It helps you a lot',
        lottie: 'ai_play',
        image: 'assets/icons/hanshake1.png',
        color: Colors.cyan,
      ),
      Onboarding(
        title: 'Smart Insights, Instant Answers',
        subtitle:
            'Get accurate information, personalized recommendations, and real-time solutions at your fingertips.',
        lottie: 'ai_speaking',
        image: 'assets/icons/hanshake2.png',
        color: Colors.cyan,
      ),
      Onboarding(
        title: 'Your Productivity Partner',
        subtitle:
            'Manage tasks, set reminders, and streamline your day with intelligent tools.',
        image: 'assets/icons/hanshake3.png',
        lottie: 'ai_robot',
        color: Colors.cyan,
      ),
      Onboarding(
        title: 'Always Learning, Always Evolving',
        subtitle:
            'Experience an assistant that adapts to your preferences and gets better with every interaction.',
        lottie: 'ai_assistant',
        image: 'assets/icons/hanshake1.png',
        color: Colors.cyan,
      ),
    ];
  }
}
