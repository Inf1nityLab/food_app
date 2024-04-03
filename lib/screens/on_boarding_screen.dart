import 'package:flutter/material.dart';
import 'package:food_app/screens/main_screen.dart';

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
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    "Let's Explore",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: green),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
