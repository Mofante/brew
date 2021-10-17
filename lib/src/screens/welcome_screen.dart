import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/login_button.dart';
import 'layout.dart';
import '../widgets/bottom_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  Future<void> _signInAnon() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      appBar: null,
      size: size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
//          SizedBox(),
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
          loginButton(
            size,
            const Color(0xffBA5A31),
            const Color(0xffFEFAE0),
            'Sign Up with Email',
            () => () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          /*SizedBox(
                height: size.height * 0.05,
              ),*/
          loginButton(
            size,
            const Color(0xffFEFAE0),
            Colors.black,
            'Sign Up with Google',
            () => _signInAnon,
          ),
          BottomText(
            size: size,
            text: 'Already have an account? ',
            clickableText: 'Sign In',
            onTap: () => () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
    );
  }
}
