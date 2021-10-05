import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/app_bar.dart';
import 'package:brew/src/widgets/recipe_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      size: size,
      appBar: appBar(() {}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Popular recipes",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: const Color(0xffFEFAE0),
              fontSize: 0.05 * size.height,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView(
                children: [
                  recipeButton(size, Colors.red, Colors.black, "xD", () {}),
                  recipeButton(size, Colors.red, Colors.black, "xD", () {}),
                  recipeButton(size, Colors.red, Colors.black, "xD", () {}),
                  recipeButton(size, Colors.red, Colors.black, "xD", () {}),
                  recipeButton(size, Colors.red, Colors.black, "xD", () {}),
                  recipeButton(size, Colors.red, Colors.black, "xD", () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
