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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
              ),
              Container(
                width: size.width * 0.8,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'An easy way to get ',
                    style: TextStyle(
                      color: Color(0xffFEFAE0),
                      fontWeight: FontWeight.w500,
                      fontSize: size.height * 0.03,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'your ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xffBA5A31),
                          fontSize: size.height * 0.03,
                        ),
                      ),
                      TextSpan(
                        text: 'perfect cup of coffee',
                        style: TextStyle(
                          color: Color(0xffFEFAE0),
                          fontWeight: FontWeight.w500,
                          fontSize: size.height * 0.03,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              loginButton(size, Color(0xffBA5A31), Color(0xffFEFAE0),
                  'Sign Up with Email'),
              /*SizedBox(
                height: size.height * 0.05,
              ),*/
              loginButton(
                  size, Color(0xffFEFAE0), Colors.black, 'Sign Up with Google'),
              Container(
                width: size.width * 0.8,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xffFEFAE0),
                    ),
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: Color(0xffFEFAE0),
                          decoration: TextDecoration.underline,
                        ),
                        text: 'Sign In',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton(Size size, Color bcolor, Color fcolor, String text) {
    return Container(
      width: size.width * 0.8,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: bcolor,
          onPrimary: fcolor,
        ),
        child: Text(text),
        onPressed: () {},
      ),
    );
  }
}
