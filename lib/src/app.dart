import 'package:brew/src/screens/log_in_page.dart';
import 'package:brew/src/screens/sign_up_page.dart';
import 'package:brew/src/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
