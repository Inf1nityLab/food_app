

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/contants/colors.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(), //destination screen
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: green,
        child: const Icon(Icons.shopping_cart, color: white, size: 25,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home,Icons.chat, Icons.notifications, Icons.favorite_border_sharp ],
        activeIndex: 0,
        elevation: 0,
        activeColor: green,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {},
        //other params
      ),

    );
  }
}
