import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBottomNavigationBar(context),
      body: const SafeArea(
          child: Center(
        child: Text("Hello World"),
      )),
    );
  }

  Widget myBottomNavigationBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home_rounded),
            Icon(Icons.bookmark_rounded),
            Icon(Icons.search_rounded),
            Icon(Icons.more_vert_rounded)
          ],
        ),
      ),
    );
  }
}
