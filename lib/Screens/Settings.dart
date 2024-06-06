import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/FireStoreHandler.dart';
import 'package:quiz_app/Data/SharedPreference.dart';
import 'package:quiz_app/Data/quizController.dart';

class quizSettings extends StatefulWidget {
  const quizSettings({super.key});

  @override
  State<quizSettings> createState() => _quizSettingsState();
}

class _quizSettingsState extends State<quizSettings> {
  final item1 = ['easy', "medium", "hard"];
  late TextEditingController QuestionRangController;
  String difficulty = 'easy';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    QuestionRangController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
//PLAY SCREEN QUIZ SELECTION ITEMS
    Widget quizSelectiom() {
      return Consumer<Quizcontroller>(builder: (context, value, child) {
        QuestionRangController.text = value.usermodel.NOQ;
        difficulty = value.usermodel.difficulty;
        return SingleChildScrollView(
          child: Column(
            children: [
              //CATEGORY SELECTION
              Card(
                color: Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //DIFFICULTY SELECTION
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Text(
                        "Select Difficulty",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 40),
                      width: double.infinity,
                      child: Card(
                        child: DropdownButton(
                            isExpanded: true,
                            alignment: Alignment.center,
                            underline: SizedBox.shrink(),
                            elevation: 0,
                            value: difficulty,
                            items: item1.map((item) {
                              return DropdownMenuItem(
                                alignment: Alignment(-0.9, 0.2),
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (item) {
                              Provider.of<Quizcontroller>(context,
                                      listen: false)
                                  .usermodel
                                  .difficulty = item!;
                              setState(() {});
                            }),
                      ),
                    ),
                    //NUMBER OF QUESTION SELECT
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 19,
                            ),
                            child: Text(
                              "Number of Questions:",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide()),
                                  focusedBorder: OutlineInputBorder()),
                              textAlign: TextAlign.center,
                              controller: QuestionRangController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                Provider.of<Quizcontroller>(context,
                                        listen: false)
                                    .usermodel
                                    .NOQ = QuestionRangController.text;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //START QUIZ BUTTON
              Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 40),
                  height: 100,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        String? id = await Sharedpreference().getToken();
                        Firestorehandler().updateUser(
                            id,
                            Provider.of<Quizcontroller>(context, listen: false)
                                .usermodel);
                        Navigator.pop(context);
                        Provider.of<Quizcontroller>(context, listen: false)
                            .Notify();
                      },
                      child: Text(
                        "DONE",
                        style: TextStyle(fontSize: 20),
                      )))
            ],
          ),
        );
      });
    }

    return quizSelectiom();
  }
}
