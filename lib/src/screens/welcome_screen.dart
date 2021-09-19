import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          color: const Color(0xff283618),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Brew.',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFEFAE0),
                  fontSize: 0.09 * size.height,
                ),
              ),
              SvgPicture.asset(
                'svgs/v60_black.svg',
                height: size.height * 0.25,
                color: Color(0xffFEFAE0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
