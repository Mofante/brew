import 'package:flutter/material.dart';

Widget recipeButton(Size size, String text, Function onTap) {
  return Container(
    width: size.width * 0.8,
    height: size.height * 0.06,
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        primary: const Color(0xff435134),
        onPrimary: const Color(0xffFEFAE0),
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
