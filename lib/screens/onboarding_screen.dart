import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {

  final introKey = GlobalKey<IntroductionScreenState>();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: 'Shop Now',
          body: 'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here',
          image: Image.asset('assets/images/splash1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Big Discount',
          body: 'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here',
          image: Image.asset('assets/images/splash2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Free Delivery',
          body: 'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here',
          image: Image.asset('assets/images/splash3.png'),
          decoration: pageDecoration,
        ),
      ],
      showSkipButton: true,
      showDoneButton: true,
      showBackButton: true,
      showNextButton: true,
      skip: Text(
          'Skip',
        style: TextStyle(
          color: Constant.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      done: Icon(
        Icons.check,  // Icon for Done
        color: Constant.primaryColor,
        size: 30,
      ),
      back: Icon(
        Icons.arrow_back_ios_rounded,
        color: Constant.primaryColor,
        size: 26,
      ),
      next: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Constant.primaryColor,
        size: 26,
      ),

      onDone: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      onSkip: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },

      dotsDecorator: DotsDecorator(
        size: Size.square(10),
        activeSize: Size(20, 10),
        activeColor: Constant.primaryColor,
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 4),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
