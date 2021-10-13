import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? appBar(Function onTap, Icon icon, String title) {
  return AppBar(
    leading: IconButton(
      onPressed: onTap(),
      icon: icon,
      color: const Color(0xffFEFAE0),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Color(0xffFEFAE0),
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: const Color(0xff283618),
  );
}
