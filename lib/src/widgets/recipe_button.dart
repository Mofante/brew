import 'package:flutter/material.dart';

Widget recipeButton(
    Size size, Color bcolor, Color fcolor, String text, Function onTap) {
  return SizedBox(
    width: size.width * 0.8,
    height: size.height * 0.06,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        primary: bcolor,
        onPrimary: fcolor,
        textStyle: TextStyle(
          fontSize: size.height * 0.025,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),
      onPressed: onTap(),
    ),
  );
}
