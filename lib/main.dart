import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/contants/colors.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/screens/on_boarding_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:food_app/widgets/glass_container_widget.dart';
import 'package:food_app/widgets/iconTextWidget.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const DatScreen(),
    );
  }
}

class DatScreen extends StatefulWidget {
  const DatScreen({super.key});

  @override
  State<DatScreen> createState() => _DatScreenState();
}

class _DatScreenState extends State<DatScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: green,
        leading: const GlassContainerWidget(
          iconData: Icons.arrow_back_ios,
          left: 10,
        ),
        actions: const [
          GlassContainerWidget(
            iconData: Icons.favorite_border_sharp,
            left: 0,
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: const Text('Food details',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.7,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
              ),
            ),
          ),
           Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:  EdgeInsets.only(top: height * 0.07),
              child: CircleAvatar(
                radius: height * 0.15,
                backgroundImage: const AssetImage('assets/food1.png'),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height * 0.4, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Avacado Salad', style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                        Text('15.00', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green))
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.remove, color: white,)),
                          const Text('1', style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: white)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.add, color: white,))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconTextWidget(iconData: Icons.star, text: '4.5', color: Colors.orangeAccent,),
                    IconTextWidget(iconData: Icons.fastfood, text: 'kcal', color: Colors.red,),
                    IconTextWidget(iconData: Icons.watch_later, text: '20min', color: Colors.orangeAccent,),
                  ],
                ),
                const SizedBox(height: 30,),
              ],
            ),
          )
        ],
      ),
    );
  }


}
