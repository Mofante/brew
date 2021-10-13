import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/app_bar.dart';
import 'package:brew/src/widgets/recipe_button.dart';
import 'package:flutter/material.dart';
import 'package:brew/src/templates.dart';
import 'package:flutter/services.dart';

int a = 0;
void xd() {
  a++;
  a--;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BrewMethod> brewMethods = [];

  Future<void> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/data.json');
    setState(() {
      brewMethods = brewMethodFromJson(jsondata);
    });
  }

  @override
  void initState() {
    super.initState();
    readJsonData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      size: size,
      appBar: appBar(() => xd, const Icon(Icons.menu_rounded), ""),
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
              child: ListView.builder(
                  itemCount: brewMethods.length,
                  itemBuilder: (context, index) {
                    return recipeButton(
                      size,
                      brewMethods[index].title,
                      () => () {
                        Navigator.pushNamed(
                          context,
                          '/brew',
                          arguments: brewMethods[index],
                        );
                      },
                    );
                  }),
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
