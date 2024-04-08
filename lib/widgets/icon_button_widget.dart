

import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  const IconButtonWidget({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: (){}, icon: Icon(iconData, size: 25, color: Colors.white, ));
  }
}
