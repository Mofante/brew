import 'dart:async';
import 'dart:html';
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
  int counter = -1;
  int dose = 0;
  int out = 0;
  Timer? _timer;
  final TextEditingController _inController = TextEditingController();
  final TextEditingController _outController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _inController.dispose();
    _inController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (counter == -1) {
      Widget _button(Size size, String text) {
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
            onPressed: () {
              setState(() {
                counter++;
              });
            },
          ),
        );
      }

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
            SizedBox(
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
            _button(size, 'Brew.')
          ],
        ),
      );
    } else {
      String _textA = widget.brewMethod.steps[counter].textA;
      String _textB = widget.brewMethod.steps[counter].textB;
      String _grind = widget.brewMethod.grind;
      int _time = widget.brewMethod.steps[counter].timer;
      int _coffee = (widget.brewMethod.steps[counter].coffee * out).round();

      void _startTimer() {
        _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
          if (widget.brewMethod.steps[counter].timer > 0) {
            setState(() {
              widget.brewMethod.steps[counter].timer--;
            });
          }
          if (widget.brewMethod.steps[counter].timer == 0) {
            _timer.cancel();
          }
        });
      }

      void update() {
        if (_timer != null) {
          _timer!.cancel();
        }
        setState(() {
          counter++;
          _textA = widget.brewMethod.steps[counter].textA;
          _textB = widget.brewMethod.steps[counter].textB;
          _grind = widget.brewMethod.grind;
          _time = widget.brewMethod.steps[counter].timer;
          _coffee = (widget.brewMethod.steps[counter].coffee * out).round();
        });
        if (_time > 0) {
          _startTimer();
        }
      }

      Widget _button(Size size, String text) {
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
            onPressed: update,
          ),
        );
      }

      return Layout(
        size: size,
        appBar: appBar(
          () => () {
            setState(() {
              counter = -1;
            });
            Navigator.pop(context);
          },
          const Icon(Icons.arrow_back_ios),
          widget.brewMethod.title,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            counter == 0
                ? SizedBox(
                    width: 0.8 * size.width,
                    child: Text(
                      _textA + _grind + _textB,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffFEFAE0),
                        fontWeight: FontWeight.w400,
                        fontSize: 0.03 * size.height,
                      ),
                    ),
                  )
                : SizedBox(
                    width: size.width * 0.8,
                    child: Text(
                      _textA + "$_coffee" + _textB,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffFEFAE0),
                        fontWeight: FontWeight.w400,
                        fontSize: 0.03 * size.height,
                      ),
                    ),
                  ),
            _time != 0
                ? Text(
                    "${widget.brewMethod.steps[counter].timer}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffFEFAE0),
                      fontWeight: FontWeight.w400,
                      fontSize: 0.1 * size.height,
                    ),
                  )
                : SizedBox(),
            _button(size, "Next")
          ],
        ),
      );
    }
  }
}
