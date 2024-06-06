import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Data/category.dart';
import 'package:quiz_app/Data/quizController.dart';
import 'package:quiz_app/Screens/quizScreen.dart';
import 'package:quiz_app/Screens/quizScreenWrapper.dart';
import 'package:quiz_app/Widgets/customScrollHeader.dart';
import 'package:quiz_app/Screens/landingScreen.dart';
import 'package:provider/provider.dart';

class MainScreenScrollView extends StatefulWidget {
  const MainScreenScrollView({super.key});

  @override
  State<MainScreenScrollView> createState() => _MainScreenScrollViewState();
}

class _MainScreenScrollViewState extends State<MainScreenScrollView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyHeaderDelegate(child: CustomHeader()),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            int key = Categories.keys.elementAt(index);
            String value = Categories[key]!.keys.first;

            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.lightBlue,
                    Colors.lightBlue,
                    Colors.indigoAccent,
                    Colors.indigo,
                  ])),
              height: 80,
              width: double.infinity,
              child: GestureDetector(
                child: Card(
                  color: Colors.indigo.withOpacity(0.5),
                  child: Center(
                      child: Text(
                    "${value}",
                    style: GoogleFonts.kanit(fontSize: 20, color: Colors.white),
                  )),
                ),
                onTap: () {
                  context.read<Quizcontroller>().getQuestions(key);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenWrapper(id: key),
                      ));
                },
              ),
            );
          }, childCount: Categories.length),
        ),
      ],
    );
  }
}

class StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 137;

  @override
  bool shouldRebuild(covariant StickyHeaderDelegate oldDelegate) {
    return false;
  }
}
