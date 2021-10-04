import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? appBar(Function onTap) {
  return AppBar(
    leading: IconButton(
      onPressed: onTap(),
      icon: Icon(Icons.arrow_back_ios),
      color: Color(0xffFEFAE0),
    ),
    backgroundColor: Color(0xff283618),
  );
}
