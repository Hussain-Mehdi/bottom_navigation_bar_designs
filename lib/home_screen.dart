import 'package:bottom_navigation_bar_designs/main.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  Container mainContainer = Container();

  HomeScreen(this.mainContainer);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double width = 65;
  double height = 95;
  double left = 7;
  double previous = 8;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: myBottomNavigationBar(),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 28.0, left: 15),
              child: Text(
                "Courses",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => const CourseCards(),
                  )
                ],
              ),
            )
          ],
        )));
  }

  Widget myBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(fit: StackFit.loose, children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOutExpo,
            margin: EdgeInsets.only(left: left),
            width: 65,
            decoration: BoxDecoration(
                color: Color.fromARGB(64, 56, 179, 236),
                borderRadius: BorderRadius.circular(15)),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      previous = 0;
                      positionTheBox(8);
                      mainScreen(0);
                    },
                    child: const Icon(
                      Icons.home_rounded,
                      size: 25,
                    )),
                GestureDetector(
                    onTap: () {
                      previous = 0;
                      positionTheBox(87);
                      mainScreen(1);
                    },
                    child: const Icon(
                      Icons.bookmark_rounded,
                      size: 25,
                    )),
                GestureDetector(
                    onTap: () {
                      previous = 85;
                      positionTheBox(167);
                      mainScreen(2);
                    },
                    child: const Icon(
                      Icons.search_rounded,
                      size: 25,
                    )),
                GestureDetector(
                    onTap: () {
                      previous = 167;
                      positionTheBox(247);
                      mainScreen(3);
                    },
                    child: const Icon(
                      Icons.more_vert_rounded,
                      size: 25,
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }

  positionTheBox(double leftMove) {
    setState(() {
      previous = leftMove;
      left == leftMove ? left = previous : left = leftMove;
    });
  }

  void mainScreen(int screenID) {
    Container mainContainer = Container();

    switch (screenID) {
      case 0:
        mainContainer = Container(
            child: Center(
          child: Text("Home Screen"),
        ));
        break;
      case 1:
        mainContainer = Container(
            child: Center(
          child: Text("Saved Data"),
        ));
        break;
      case 2:
        mainContainer = Container(
            child: Center(
          child: Text("Search"),
        ));
        break;
      case 3:
        mainContainer = Container(
            child: Center(
          child: Text("Options"),
        ));
        break;
    }

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomeScreen(mainContainer),
    //     ));
    setState(() {
      HomeScreen(mainContainer);
    });
  }
}

class CourseCards extends StatelessWidget {
  const CourseCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        height: 230,
        width: 220,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Course Name Here",
                    style: TextStyle(
                        color: Color.fromARGB(195, 0, 0, 0),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 5),
                    child: Text(
                      "This course will help you learn app development. Couse is designed by a good professor.",
                      style: TextStyle(
                          color: Color.fromARGB(195, 0, 0, 0),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Text(
                    "61 SECTIONS - 11 hours",
                    style: TextStyle(
                        color: Color.fromARGB(195, 0, 0, 0),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                          3,
                          (index) => Transform.translate(
                                offset: Offset((-15 * index).toDouble() - 5, 0),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("./images/circle.png"),
                                ),
                              ))
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("./images/circle.png"))),
            ),
          ],
        ),
      ),
    );
  }
}
