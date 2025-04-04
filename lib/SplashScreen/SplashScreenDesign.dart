import 'package:flutter/material.dart';

import 'SplashScreenPages.dart';

class SpalshScreen extends StatelessWidget {
  SpalshScreen({super.key});

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SplashScreenPages(
            image: Image.asset("assets/images/1.png"),
            title: "Start Learning",
            description:
                "Start learning now by using this app, Get your choosen course and start the journey.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 0,
          ),
          SplashScreenPages(
            image: Image.asset("assets/images/2.png"),
            title: "Explore Courses",
            description:
                "Choose which course is suitable for you to enroll in.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 1,
          ),
          //lets add 3rd screen
          SplashScreenPages(
            image: Image.asset("assets/images/3.png"),
            title: "At Any time.",
            description:
                "Your courses is available at any time you want. Join us now !",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 2,
          ),
        ],
      ),
    );
  }

  void changeScreen(int nextScreenNo) {
    controller.animateToPage(
      nextScreenNo,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
