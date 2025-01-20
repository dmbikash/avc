import 'package:flutter/material.dart';

import '../theme/colors.dart';


class ThemeButton {
  static elevatedButtonDynamic({
    required Color color,
    double radius = 20,

  }) {
    return ElevatedButton.styleFrom(


      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }

  static Widget submitButton({
    required VoidCallback onPressed,
    name = "Submit",
    color = ThemeColor.orange,
    radius = 20.0,
    buttonTextColor = Colors.white,
  }) {
    return ElevatedButton(

      style: elevatedButtonDynamic(color: color, radius: radius,),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          color: buttonTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget expandedButton({
    required VoidCallback onPressed,
    name = "Submit",
    color = ThemeColor.orange,
    radius = 20.0,
    buttonTextColor = Colors.white,
  }) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: elevatedButtonDynamic(color: color, radius: radius),
            onPressed: onPressed,
            child: Text(
              name,
              style: TextStyle(
                color: buttonTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
