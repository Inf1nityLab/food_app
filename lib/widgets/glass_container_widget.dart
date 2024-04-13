

import 'dart:ui';

import 'package:flutter/material.dart';

import '../contants/colors.dart';

class GlassContainerWidget extends StatelessWidget {
  final Widget icon;
  final double left;
  const GlassContainerWidget({super.key, required this.icon, required this.left});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ClipRect(

        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.only(left: left),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200.withOpacity(0.5),
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}
