import 'package:flutter/material.dart';
import 'package:quiz_app/Data/FireStoreHandler.dart';
import 'package:quiz_app/Data/Quizhttphelper.dart';
import 'package:quiz_app/Data/SharedPreference.dart';
import 'package:quiz_app/Model/UserModel.dart';
import 'package:quiz_app/Model/quizModel.dart';

class Quizcontroller with ChangeNotifier {
  int response = -1;

  int index = 0;
  List<Quizmodel> questionlist = [];
  List<dynamic> answer = [];
  late Usermodel usermodel;

  quizHttp http = quizHttp();

  List<Quizmodel> get getList => questionlist;
  String get correctAnswer => questionlist[index].correctAnswer;

  void setModel(Usermodel usermodel) {
    this.usermodel = usermodel;
  }

  int get getresponse => response;

  Future<void> getQuestions(int id) async {
    response = -1;
    index = 0;
    questionlist.clear();
    try {
      await http.Getquestions(usermodel.NOQ, id, usermodel.difficulty)
          .then((value) async {
        for (var item in value["results"]) {
          questionlist.add(Quizmodel.fromJson(item));
        }
        response = value["response_code"];
        shuffle();
        notifyListeners();
      });
    } catch (e) {
      // Handle errors, e.g., show an error message to the user
      print('Error fetching questions: $e');
    }
  }

  void shuffle() {
    List<dynamic> temporaryList = [];
    temporaryList.addAll(questionlist[index].incorrectAnswers);
    temporaryList.add(questionlist[index].correctAnswer);
    temporaryList.shuffle();
    answer = temporaryList;
  }

  void updateIndex() {
    index++;
    shuffle();
    notifyListeners();
  }

  void Notify() {
    notifyListeners();
  }

  void setScore(int score) {
    switch (usermodel.difficulty) {
      case "easy":
        usermodel.easy = score.toString();
        break;
      case "medium":
        usermodel.easy = score.toString();
        break;
      case "hard":
        usermodel.easy = score.toString();
        break;
    }
  }

  String GetSCore() {
    switch (usermodel.difficulty) {
      case "easy":
        return usermodel.easy;
        break;
      case "medium":
        return usermodel.easy;
        break;
      case "hard":
        return usermodel.easy;
        break;
      default:
        return "";
    }
  }
}
