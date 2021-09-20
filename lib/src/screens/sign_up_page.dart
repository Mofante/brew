import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/input_field.dart';
import 'package:brew/src/widgets/login_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
            'Welcome!',
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
          inputField(size, 'Pseudonim', false),
          inputField(size, 'Password', true),
          inputField(size, 'Confirm Password', false),
          SizedBox(
            height: size.height * 0.05,
          ),
          loginButton(
              size, const Color(0xffBA5A31), const Color(0xffFEFAE0), 'Sign Up')
        ],
      ),
    );
  }
}
