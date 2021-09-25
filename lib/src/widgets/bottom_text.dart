import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText(
      {Key? key,
      required this.onTap,
      required this.size,
      required this.text,
      required this.clickableText})
      : super(key: key);

  final Size size;
  final String text;
  final String clickableText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            color: Color(0xffFEFAE0),
          ),
          text: text,
          children: [
            TextSpan(
              style: const TextStyle(
                color: Color(0xffFEFAE0),
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap(),
              text: clickableText,
            ),
          ],
        ),
      ),
    );
  }
}
