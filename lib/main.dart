import 'package:flutter/material.dart';
import 'package:quiz_app/Data/quizController.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/Screens/LoginWrapper.dart';
import 'package:quiz_app/Screens/loginpage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  late Quizcontroller controller;

  QuizApp({super.key}) {
    controller = Quizcontroller();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: controller)],
      child: MaterialApp(
        home: Loginwrapper(),
      ),
    );
  }
}
