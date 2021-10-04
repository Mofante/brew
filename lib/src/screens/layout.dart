import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Size size;
  final Widget child;
  final PreferredSizeWidget? appBar;
  const Layout(
      {Key? key, required this.size, required this.child, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          color: const Color(0xff283618),
          child: child,
        ),
      ),
    );
  }
}
