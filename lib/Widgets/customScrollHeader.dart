import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Data/quizController.dart';
import 'package:quiz_app/Screens/Profile.dart';
import 'package:quiz_app/Screens/Settings.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/headerbg.jpg"), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: quizSettings()),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(Icons.person_2_rounded),
                    color: Colors.white,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Profile()),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
              child: Text("Let's Start!",
                  style: GoogleFonts.kanit(
                      textStyle: TextStyle(fontSize: 40, color: Colors.white))),
            ),
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15),
                child: Text("Play the quiz to test and gain new knowledge",
                    style: TextStyle(fontSize: 20, color: Colors.grey[300]))),
          ),
          Flexible(child: ScoreRow()),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 6),
            child: Text(
              "Categories",
              style: GoogleFonts.kanit(
                  textStyle: TextStyle(fontSize: 30, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreRow extends StatefulWidget {
  const ScoreRow({super.key});

  @override
  State<ScoreRow> createState() => _ScoreRowState();
}

class _ScoreRowState extends State<ScoreRow> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Quizcontroller>(
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.only(left: 1, right: 5),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              gradient: LinearGradient(colors: [
                Colors.lightBlueAccent,
                Colors.lightBlue,
                Colors.indigoAccent,
                Colors.indigo,
              ])),
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.transparent,
            elevation: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Highest Score",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text(
                    "${value.GetSCore()}    |    ${value.usermodel.difficulty}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
