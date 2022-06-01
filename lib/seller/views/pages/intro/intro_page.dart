import 'package:picco/seller/views/pages/intro/intro_1.dart';
import 'package:picco/seller/views/pages/intro/intro_2.dart';
import 'package:picco/seller/views/pages/intro/intro_3.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: IntroController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:  [
          FirstIntroPage(),
          SecondIntroPage(),
          ThirdIntroPage(),
        ],
        onPageChanged: (int index) {
          IntroController.navigate(index);
        },
      ),
    );
  }
}

class IntroController {
  static PageController pageController = PageController();
  static navigate(int index) => pageController.animateToPage(
        index,
         duration: const Duration(milliseconds: 800),
         curve: Curves.easeOutCubic,
      );
}
