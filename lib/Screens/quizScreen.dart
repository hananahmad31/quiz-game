import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/FireStoreHandler.dart';
import 'package:quiz_app/Data/SharedPreference.dart';
import 'package:quiz_app/Data/category.dart';
import 'package:quiz_app/Data/quizController.dart';
import 'package:quiz_app/Model/quizModel.dart';
import 'package:quiz_app/Screens/landingScreen.dart';

class QuizScreen extends StatefulWidget {
  int imgID;
  QuizScreen({super.key, required this.imgID});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Consumer<Quizcontroller>(
          builder: (context, value, child) {
            bool check = false;
            Map<String, String>? nestedMap = Categories[widget.imgID];
            String innerkey = nestedMap!.keys.first;

            void checkAnswer(id) async {
              if (value.answer[id] == value.correctAnswer) {
                if (check == false) {
                  score++;
                }
                if ((value.index + 1).toString() == value.usermodel.NOQ) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("CONGRATULATIONS!"),
                          title: Text(
                            "QUIZ COMPLETED!",
                            style: TextStyle(color: Colors.green),
                          ),
                        );
                      }).then((onValue) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingScreen(),
                        ));
                  });
                } else {
                  value.updateIndex();
                }
              } else {
                check = true;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(
                      "TRY AGAIN!",
                    ),
                    title: Text(
                      "WRONG!",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
            }

            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "${Categories[widget.imgID]![innerkey]}.jpg"),
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Card(
                            color: Colors.white.withOpacity(0.8),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${value.getList[value.index].question}",
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 120,
                              child: GestureDetector(
                                child: Card(
                                  color: Colors.white.withOpacity(0.8),
                                  child: Center(
                                    child: Text(
                                      "${value.answer[0]}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  checkAnswer(0);
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 120,
                              child: GestureDetector(
                                child: Card(
                                  color: Colors.white.withOpacity(0.8),
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "${value.answer[1]}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  checkAnswer(1);
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 120,
                            child: GestureDetector(
                              child: Card(
                                color: Colors.white.withOpacity(0.8),
                                child: Center(
                                  child: Text(
                                    "${value.answer[2]}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              onTap: () {
                                checkAnswer(2);
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 120,
                            child: GestureDetector(
                              child: Card(
                                color: Colors.white.withOpacity(0.8),
                                child: Center(
                                  child: Text(
                                    "${value.answer[3]}",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              onTap: () {
                                checkAnswer(3);
                              },
                            ),
                          ),
                        ])
                      ],
                    )),
                  )
                ],
              ),
            );
          },
        ));
  }
}
