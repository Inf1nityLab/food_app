import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Color backColor;
  final Color textColor;
  final Function() onPressed;
  final String text;
  const ElevatedButtonWidget(
      {super.key,
      required this.backColor,
      required this.textColor,
      required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: textColor),
          )),
    );
  }
}
