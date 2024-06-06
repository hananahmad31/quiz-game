import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/FireStoreHandler.dart';
import 'package:quiz_app/Data/SharedPreference.dart';
import 'package:quiz_app/Data/quizController.dart';
import 'package:quiz_app/Screens/Settings.dart';
import 'package:quiz_app/Screens/settingsScreen.dart';
import 'package:quiz_app/Widgets/customScrollView.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Future<void> getUserData() async {
    var token = await Sharedpreference().getToken();

    var model = await Firestorehandler().getUser(token!);
    Provider.of<Quizcontroller>(context, listen: false).setModel(model);
  }

  @override
  Widget build(BuildContext context) {
//MENU SCREEN STARTS HERE
    return FutureBuilder(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: MainScreenScrollView(),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
