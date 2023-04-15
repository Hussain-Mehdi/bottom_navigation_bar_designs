import 'package:flutter/material.dart';

import 'model/course_detail.dart';
import 'utils/color.dart';

class HomeScreen extends StatefulWidget {
  Container mainContainer = Container();

  HomeScreen(this.mainContainer, {super.key});
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
        resizeToAvoidBottomInset: false,
        extendBody: true,
        bottomNavigationBar: myBottomNavigationBar(),
        body: SingleChildScrollView(
          child: SafeArea(
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
                      4,
                      (index) => CourseCards(
                          courseDetail[index].courseName,
                          courseDetail[index].courseDescription,
                          courseDetail[index].courseImage,
                          courseDetail[index].courseStatus,
                          courseDetail[index].imagesBunch,
                          cardColors[index]),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 28.0, left: 15),
                child: Text(
                  "Recent",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ...List.generate(
                      4,
                      (index) => RecentCards(
                          courseDetail[index].courseName,
                          courseDetail[index].courseDescription,
                          courseDetail[index].courseImage,
                          courseDetail[index].courseStatus,
                          courseDetail[index].imagesBunch,
                          cardColors[index]),
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }

  Widget myBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 68, 68, 68),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(fit: StackFit.loose, children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOutExpo,
            margin: EdgeInsets.only(left: left),
            width: 65,
            decoration: BoxDecoration(
                color: const Color.fromARGB(64, 56, 179, 236),
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                      color: Colors.white,
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
            child: const Center(
          child: Text("Home Screen"),
        ));
        break;
      case 1:
        mainContainer = Container(
            child: const Center(
          child: Text("Saved Data"),
        ));
        break;
      case 2:
        mainContainer = Container(
            child: const Center(
          child: Text("Search"),
        ));
        break;
      case 3:
        mainContainer = Container(
            child: const Center(
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
  String courseName;
  String courseDescription;
  String courseStatus;
  String courseImage;
  List<String> imagesBunch = [];
  Color cardColor;
  CourseCards(this.courseName, this.courseDescription, this.courseImage,
      this.courseStatus, this.imagesBunch, this.cardColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        height: 230,
        width: 220,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: const TextStyle(
                        color: Color.fromARGB(195, 0, 0, 0),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 5),
                    child: Text(
                      courseDescription,
                      style: const TextStyle(
                          color: Color.fromARGB(195, 0, 0, 0),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Text(
                    courseStatus,
                    style: const TextStyle(
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
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage(imagesBunch[index]),
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
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(courseImage))),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentCards extends StatelessWidget {
  String courseName;
  String courseDescription;
  String courseStatus;
  String courseImage;
  List<String> imagesBunch = [];
  Color cardColor;
  RecentCards(this.courseName, this.courseDescription, this.courseImage,
      this.courseStatus, this.imagesBunch, this.cardColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        height: 80,
        //width: 220,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 60,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: const TextStyle(
                        color: Color.fromARGB(195, 0, 0, 0),
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    courseStatus,
                    style: const TextStyle(
                        color: Color.fromARGB(195, 0, 0, 0),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const VerticalDivider(),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(courseImage))),
            ),
          ],
        ),
      ),
    );
  }
}
