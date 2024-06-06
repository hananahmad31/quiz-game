import 'package:http/http.dart';

class Usermodel {
  String NOQ = "10";
  String difficulty = "";
  String easy = "";
  String medium = "";
  String hard = "";

  Usermodel(
      {required this.NOQ,
      required this.difficulty,
      required this.easy,
      required this.hard,
      required this.medium});
}
