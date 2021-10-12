import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:brew/src/templates.dart';

class BrewScreen extends StatelessWidget {
  const BrewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      size: size,
      appBar: appBar(() {}, Icon(Icons.arrow_back_ios)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(""),
        ],
      ),
    );
  }
}
