import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? appBar(Function onTap, Icon icon) {
  return AppBar(
    leading: IconButton(
      onPressed: onTap(),
      icon: icon,
      color: Color(0xffFEFAE0),
    ),
    backgroundColor: Color(0xff283618),
  );
}
