import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/textStyles.dart';
class SquareButton extends StatelessWidget {
  final IconData icon;  // Icon to display on the button
  final bool useIcon;   // Whether to display the icon (default is true)
  final VoidCallback onPressed;

  final String title; // Function to execute on button press

  const SquareButton({super.key,
    required this.icon,
    this.useIcon = true, // Default to true
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      style: ButtonStyle(
        surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(ThemeColor.grey),
        overlayColor: MaterialStateProperty.all(ThemeColor.primary.withOpacity(.45),),
        shadowColor: MaterialStateProperty.all(Colors.black),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1, // Forces the button to be square
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CircleAvatar(
              backgroundColor: ThemeColor.primary,
              radius: 40,
              child: Center(
                child: useIcon
                    ? Icon(
                  icon, // Show the icon if useIcon is true
                  size: 40.0,
                  color:  ThemeColor.backGroundColor,
                )
                    : null, // No icon if useIcon is false
              ),
            ),
            SizedBox(
              width: 100
              ,child: Text(title, textAlign: TextAlign.center,style: ThemeTextStyles.label,),),
          ],
        ),
      ),
    );
  }
}