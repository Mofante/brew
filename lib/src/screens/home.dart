import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/app_bar.dart';
import 'package:brew/src/widgets/recipe_button.dart';
import 'package:flutter/material.dart';

int a = 0;
void xd() {
  a++;
  a--;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      size: size,
      appBar: appBar(() => xd, Icon(Icons.menu_rounded)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: size.width * 0.1),
            width: size.width * 0.8,
            child: Text(
              "Popular Brew Methods",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: const Color(0xffFEFAE0),
                fontSize: 0.05 * size.height,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: size.width * 0.8,
              child: ListView(
                children: [
                  recipeButton(size, "4:6 By Tetsu Kasuya", () => xd),
                  recipeButton(size, "James Hoffmann's V60", () => xd),
                  recipeButton(size, "April Coffee V60", () => xd),
                  recipeButton(size, "European Coffee Trip v60", () => xd),
                  recipeButton(size, "Osmotic Flow", () => xd),
                  recipeButton(size, "One Pour By Tetsu Kasuya", () => xd),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.12,
          )
        ],
      ),
    );
  }
}
