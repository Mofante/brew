import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget inputField(Size size, String hintText, bool isPassword) {
  return SizedBox(
    width: size.width * 0.8,
    height: size.height * 0.06,
    child: TextFormField(
      obscureText: isPassword,
      obscuringCharacter: '*',
      cursorColor: Color(0xffFEFAE0),
      style: TextStyle(
        color: Color(0xffFEFAE0),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0x5DFEFAE0),
        ),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Color(0xff435134),
      ),
    ),
  );
}
