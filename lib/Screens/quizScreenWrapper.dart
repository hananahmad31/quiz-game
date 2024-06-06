import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/quizController.dart';
import 'package:quiz_app/Screens/quizScreen.dart';

class ScreenWrapper extends StatefulWidget {
  int id;
  ScreenWrapper({super.key, required this.id});

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Quizcontroller>(
      builder: (context, value, child) {
        if (value.getresponse == 0) {
          return QuizScreen(imgID: widget.id);
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
