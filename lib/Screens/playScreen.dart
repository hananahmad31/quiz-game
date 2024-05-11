import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class playScreen extends StatefulWidget {
  const playScreen({super.key});

  @override
  State<playScreen> createState() => _playScreenState();
}

class _playScreenState extends State<playScreen> {
  final item = ["112312312312", "2", "3"];
  final item1 = ["easy", "medium", "hard"];
  late TextEditingController QuestionRangController;
  int QuestioRang = 10;
  String CategorySelect = "2";
  String DifficultySelect = "easy";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    QuestionRangController = TextEditingController(text: "10");
  }

  void changeState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
//PLAY SCREEN QUIZ SELECTION ITEMS
    Widget quizSelectiom() {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 10),
                    child: Text(
                      "Select Category",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    width: double.infinity,
                    child: Card(
                      child: DropdownButton(
                          isExpanded: true,
                          alignment: Alignment.center,
                          underline: SizedBox.shrink(),
                          elevation: 0,
                          value: CategorySelect,
                          items: item.map((item) {
                            return DropdownMenuItem(
                              alignment: Alignment(-0.9, 0.2),
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (item) {
                            setState(() {
                              CategorySelect = item!;
                            });
                          }),
                    ),
                  ),
                  //DIFFICULTY SELECTION
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
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
                          value: DifficultySelect,
                          items: item1.map((item) {
                            return DropdownMenuItem(
                              alignment: Alignment(-0.9, 0.2),
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (item) {
                            setState(() {
                              DifficultySelect = item!;
                            });
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
                            "Number of Questions for Quiz:",
                            style: TextStyle(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 40, 64, 202)),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.indigoAccent)),
                                focusedBorder: OutlineInputBorder()),
                            textAlign: TextAlign.center,
                            controller: QuestionRangController,
                            keyboardType: TextInputType.number,
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
                    onPressed: () {},
                    child: Text(
                      "Start quiz",
                      style: TextStyle(fontSize: 20),
                    )))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quiz Preference"),
      ),
      body: quizSelectiom(),
    );
  }
}
