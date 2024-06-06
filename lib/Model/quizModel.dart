class Quizmodel {
  String type;
  String difficulty;
  String category;
  String question;
  String correctAnswer;
  List incorrectAnswers;

  Quizmodel(
      {required this.category,
      required this.correctAnswer,
      required this.difficulty,
      required this.question,
      required this.type,
      required this.incorrectAnswers});

  factory Quizmodel.fromJson(Map<String, dynamic> json) {
    return Quizmodel(
      type: Uri.decodeFull(json['type']),
      difficulty: Uri.decodeFull(json['difficulty']),
      category: Uri.decodeFull(json['category']),
      question: Uri.decodeFull(json['question']),
      correctAnswer: Uri.decodeFull(json['correct_answer']),
      incorrectAnswers: json['incorrect_answers']
          .map((e) => Uri.decodeFull(e))
          .toList()
          .cast<String>(),
    );
  }
}
