import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/playScreen.dart';
import 'package:quiz_app/Screens/settingsScreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
//MENU SCREEN BUTTONS AND NAVIGATION
    List<Widget> menuList = [
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => playScreen()));
            },
            child: Text(
              "Play",
              style: TextStyle(fontSize: 40),
            )),
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => settingsScreen()));
          },
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 40),
          )),
      Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: TextButton(
            onPressed: () {
              exit(0);
            },
            child: Text(
              "Exit",
              style: TextStyle(fontSize: 40),
            )),
      ),
    ];
//MENU SCREEN STARTS HERE
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.person_2_rounded,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: menuList,
            ),
          ),
        ],
      ),
    );
  }
}
