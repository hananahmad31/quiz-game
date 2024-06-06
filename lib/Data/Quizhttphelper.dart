import 'dart:convert';

import 'package:http/http.dart' as http;


class quizHttp {
  quizHttp();

  Future<Map<String, dynamic>> Getquestions(range, id, difficulty) async {
    String url =
        "https://opentdb.com/api.php?amount=${range}&category=${id}&difficulty=${difficulty}&encode=url3986&type=multiple";
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }
}//https://opentdb.com/api.php?amount=10&category=16&difficulty=medium
