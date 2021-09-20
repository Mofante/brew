import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/login_button.dart';
import 'layout.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      size: size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Brew.',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: const Color(0xffFEFAE0),
              fontSize: 0.1 * size.height,
            ),
          ),
          SvgPicture.asset(
            'svgs/v60_black.svg',
            height: size.height * 0.25,
            color: const Color(0xffFEFAE0),
          ),
          SizedBox(
            width: size.width * 0.8,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'An easy way to get ',
                style: TextStyle(
                  color: const Color(0xffFEFAE0),
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.03,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'your ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffBA5A31),
                      fontSize: size.height * 0.03,
                    ),
                  ),
                  TextSpan(
                    text: 'perfect cup of coffee',
                    style: TextStyle(
                      color: const Color(0xffFEFAE0),
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
          loginButton(size, const Color(0xffBA5A31), const Color(0xffFEFAE0),
              'Sign Up with Email'),
          /*SizedBox(
                height: size.height * 0.05,
              ),*/
          loginButton(size, const Color(0xffFEFAE0), Colors.black,
              'Sign Up with Google'),
          SizedBox(
            width: size.width * 0.8,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Color(0xffFEFAE0),
                ),
                text: 'Already have an account? ',
                children: [
                  TextSpan(
                    style: const TextStyle(
                      color: Color(0xffFEFAE0),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: 'Sign In',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
