import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
        appBar: appBar(
            () => () {
                  Navigator.pushReplacementNamed(context, '/');
                },
            const Icon(Icons.arrow_back_ios),
            ""),
        size: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 0.8 * size.width,
              child: Text(
                "Your perfect brew is ready",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffFEFAE0),
                  fontWeight: FontWeight.w400,
                  fontSize: 0.07 * size.height,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Color(0xffBA5A31),
                  onPrimary: Color(0xffFEFAE0),
                  textStyle: TextStyle(
                    fontSize: size.height * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: Text("Enjoy!"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
              ),
            )
          ],
        ));
  }
}
