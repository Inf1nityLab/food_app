
import 'package:flutter/cupertino.dart';
import 'package:food_app/contants/colors.dart';

class IconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  const IconTextWidget({super.key, required this.iconData, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, size: 25, color: color,),
        const SizedBox(width: 5,),
        Text(text, style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: grey))
      ],
    );
  }
}
