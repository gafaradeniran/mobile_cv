import 'package:flutter/material.dart';
import 'package:mobile_cv/constants/styles.dart';

Widget button(String text, Icon icon, void Function() onPressed) {
  return TextButton.icon(
    onPressed: onPressed,
    icon: icon,
    label: Text(text, style: buttonStyle),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(12.0)),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),
  );
}
