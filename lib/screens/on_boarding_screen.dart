import 'package:flutter/material.dart';
import 'package:food_app/screens/main_screen.dart';
import 'package:food_app/widgets/elevated_button_widget.dart';

import '../contants/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage('assets/food1.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Fast delivery at ',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: white),
            ),
            const Text(
              'your doorstop',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: white),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Home delivery and online reservation',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: white),
            ),
            const Text(
              'system for restaurants and cafe',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500, color: white),
            ),
            Expanded(child: Container()),
            ElevatedButtonWidget(
                backColor: white,
                textColor: green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                },
            text: "Let's explore",)
          ],
        ),
      ),
    );
  }
}
