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
  double width = 60;
  double height = 95;
  double left = 7;
  double previous = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: myBottomNavigationBar(), body: widget.mainContainer
        // const SafeArea(
        //     child: Center(
        //   child: Text("Bottom Navigation Bar"),
        // )),
        );
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
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      positionTheBox(8);
                      mainScreen(0);
                    },
                    child: const Icon(Icons.home_rounded)),
                GestureDetector(
                    onTap: () {
                      previous = 8;
                      positionTheBox(87);
                      mainScreen(1);
                    },
                    child: const Icon(Icons.bookmark_rounded)),
                GestureDetector(
                    onTap: () {
                      previous = 85;
                      positionTheBox(167);
                      mainScreen(2);
                    },
                    child: const Icon(Icons.search_rounded)),
                GestureDetector(
                    onTap: () {
                      previous = 167;
                      positionTheBox(247);
                      mainScreen(3);
                    },
                    child: const Icon(Icons.more_vert_rounded))
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
