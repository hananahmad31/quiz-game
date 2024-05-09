import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: menuList,
        ),
      ),
    );
  }

  List<Widget> menuList = [
    TextButton(onPressed: () {}, child: Text("Play")),
    TextButton(onPressed: () {}, child: Text("Settings")),
    TextButton(onPressed: () {}, child: Text("Exit")),
  ];
}
