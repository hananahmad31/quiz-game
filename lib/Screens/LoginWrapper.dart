import 'package:flutter/material.dart';
import 'package:quiz_app/Data/SharedPreference.dart';
import 'package:quiz_app/Data/authService.dart';
import 'package:quiz_app/Screens/landingScreen.dart';
import 'package:quiz_app/Screens/loginpage.dart';

class Loginwrapper extends StatefulWidget {
  Loginwrapper({super.key});

  @override
  State<Loginwrapper> createState() => _LoginwrapperState();
}

class _LoginwrapperState extends State<Loginwrapper> {
  Sharedpreference sharedpreference = Sharedpreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sharedpreference.getToken(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoginScreen();
        } else {
          
          return LandingScreen();
        }
      },
    );
  }
}
