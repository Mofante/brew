import 'package:brew/src/screens/layout.dart';
import 'package:brew/src/widgets/app_bar.dart';
import 'package:brew/src/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:brew/src/templates.dart';

class BrewScreen extends StatefulWidget {
  const BrewScreen({Key? key, required this.brewMethod}) : super(key: key);

  final BrewMethod brewMethod;

  @override
  State<BrewScreen> createState() => _BrewScreenState();
}

class _BrewScreenState extends State<BrewScreen> {
  int dose = 0;
  int out = 0;
  final TextEditingController _inController = TextEditingController();
  final TextEditingController _outController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Layout(
      size: size,
      appBar: appBar(
        () => () {
          Navigator.pop(context);
        },
        const Icon(Icons.arrow_back_ios),
        widget.brewMethod.title,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Dose:",
                style: TextStyle(
                  color: Color(0xffFEFAE0),
                  fontWeight: FontWeight.w400,
                  fontSize: 0.04 * size.height,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                controller: _inController,
                onChanged: (value) {
                  setState(() {
                    dose = int.parse(value);
                    out = (dose / widget.brewMethod.ratio).round();
                    _outController.text = "$out";
                  });
                },
                //initialValue: "$dose",
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                cursorColor: const Color(0xffFEFAE0),
                style: TextStyle(
                  color: Color(0xffFEFAE0),
                  fontWeight: FontWeight.w400,
                  fontSize: 0.05 * size.height,
                ),
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.4,
                  ),
                  suffixText: 'g',
                  suffixStyle: TextStyle(
                    color: Color(0xffFEFAE0),
                    fontWeight: FontWeight.w400,
                    fontSize: 0.05 * size.height,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: const Color(0xff435134),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "Your Output:",
                style: TextStyle(
                  color: Color(0xffFEFAE0),
                  fontWeight: FontWeight.w400,
                  fontSize: 0.04 * size.height,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                controller: _outController,
                //initialValue: "$out",
                onChanged: (value) {
                  setState(() {
                    out = int.parse(value);
                    dose = (out * widget.brewMethod.ratio).round();
                    _inController.text = "$dose";
                  });
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                cursorColor: const Color(0xffFEFAE0),
                style: TextStyle(
                  color: Color(0xffFEFAE0),
                  fontWeight: FontWeight.w400,
                  fontSize: 0.05 * size.height,
                ),
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.4,
                  ),
                  suffixText: 'g',
                  suffixStyle: TextStyle(
                    color: Color(0xffFEFAE0),
                    fontWeight: FontWeight.w400,
                    fontSize: 0.05 * size.height,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: const Color(0xff435134),
                ),
              ),
            ],
          ),
          Container(
            width: size.width * 0.8,
            child: Text(
              "Prepare your brewer, scales and your favourite cup. Boil some water, rince the filter and get ready to",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffFEFAE0),
                fontWeight: FontWeight.w400,
                fontSize: 0.03 * size.height,
              ),
            ),
          ),
          button(size, 'Brew.')
        ],
      ),
    );
  }
}

Widget button(Size size, String text) {
  return SizedBox(
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
      child: Text(text),
      onPressed: () {},
    ),
  );
}
