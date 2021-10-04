import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/app_bar.dart';
import 'package:brew/src/widgets/bottom_text.dart';
import 'package:brew/src/widgets/input_field.dart';
import 'package:brew/src/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      appBar: appBar(
        () => () {
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
      size: size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Welcome back!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: const Color(0xffFEFAE0),
              fontSize: 0.06 * size.height,
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          inputField(size, 'Email', false),
          inputField(size, 'Password', true),
          loginButton(
            size,
            const Color(0xffBA5A31),
            const Color(0xffFEFAE0),
            'Sign In',
            () {},
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          BottomText(
            size: size,
            text: "Don't have an account? ",
            clickableText: 'Sign Up',
            onTap: () => () {
              Navigator.pushReplacementNamed(context, '/register');
            },
          )
        ],
      ),
    );
  }
}
