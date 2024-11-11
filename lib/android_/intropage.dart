import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../sp/shareprefrance.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome",
            body: "Explore our amazing app features",
            image: Center(
              child: Image.asset('lib/assets/img/01.png', height: 175),
            ),
            decoration: PageDecoration(
              titleTextStyle:
                  TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(fontSize: 18),
            ),
          ),
          PageViewModel(
            title: "Seamless Connectivity",
            body: "Stay in touch with your contacts anytime, anywhere.",
            image: Center(
              child: Image.asset('lib/assets/img/04.png', height: 175),
            ),
            decoration: PageDecoration(
              titleTextStyle:
                  TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(fontSize: 18),
            ),
          ),
          PageViewModel(
            title: "Discover",
            body: "Effortlessly manage and grow your contacts network.",
            image: Center(
              child: Image.asset('lib/assets/img/03.png', height: 175),
            ),
            decoration: PageDecoration(
              titleTextStyle:
                  TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
        onDone: () async {
          MySharedPreferences my = MySharedPreferences();
          await my.setShow(true);
          Navigator.pushReplacementNamed(context, '/home');
        },
        onSkip: () async {
          // Set the value to true when the user skips the intro
          MySharedPreferences my = MySharedPreferences();
          await my.setShow(true);
          Navigator.pushReplacementNamed(context, '/home');
        },
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Get Started",
            style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          color: Colors.grey,
          activeSize: const Size(22.0, 10.0),
          activeColor: Colors.blue,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
