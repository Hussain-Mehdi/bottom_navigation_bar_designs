import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double width = 60;
  double height = 40;
  double left = 7;
  double previous = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBottomNavigationBar(context),
      body: const SafeArea(
          child: Center(
        child: Text("Bottom Navigation Bar"),
      )),
    );
  }

  Widget myBottomNavigationBar(BuildContext context) {
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
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOutExpo,
            margin: EdgeInsets.only(left: left),
            height: height,
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
                    },
                    child: const Icon(Icons.home_rounded)),
                GestureDetector(
                    onTap: () {
                      previous = 7;
                      positionTheBox(87);
                      print("Hello==================");
                    },
                    child: const Icon(Icons.bookmark_rounded)),
                GestureDetector(
                    onTap: () {
                      previous = 85;
                      positionTheBox(167);
                    },
                    child: const Icon(Icons.search_rounded)),
                GestureDetector(
                    onTap: () {
                      previous = 167;
                      positionTheBox(247);
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
}
