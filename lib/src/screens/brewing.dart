import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:brew/src/templates.dart';

class BrewScreen extends StatelessWidget {
  const BrewScreen({Key? key, required this.brewMethod}) : super(key: key);

  final BrewMethod brewMethod;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      size: size,
      appBar: appBar(
        () => () {
          Navigator.pop(context);
        },
        const Icon(Icons.arrow_back_ios),
        brewMethod.title,
      ),
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
