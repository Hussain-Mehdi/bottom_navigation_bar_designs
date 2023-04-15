import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/film_model.dart';
import './home_screen.dart';
import 'mycard.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  //List<Films> filmList = [];
  double width = 65;
  double height = 95;
  double left = 7;
  double previous = 8;
  int selectedIndex = 0;
  TextEditingController username = TextEditingController();
  List<Films> searchFilm = [];
  @override
  void initState() {
    getFilmDetail();

    super.initState();
  }

  searchUser(String username) {
    setState(() {
      searchFilm = filmList
          .where((element) =>
              element.titleFilm.toLowerCase().contains(username.toLowerCase()))
          .toList();
    });
  }

  Future<List<Films>> getFilmDetail() async {
    final jsonData = await rootBundle.loadString("./jsonfile/data.json");
    var jsonfile = json.decode(jsonData) as List;
    filmList = jsonfile.map((e) => Films.fromJson(e)).toList();
    loadData();
    return filmList;
  }

  loadData() {
    searchFilm = List.from(filmList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Films",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: myBottomNavigationBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: username,
            decoration: InputDecoration(
                filled: true,
                hintText: "Search",
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_rounded)),
                fillColor: const Color.fromARGB(14, 0, 0, 0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                )),
            onChanged: (value) => searchUser(value.toString()),
          ),
        ),
        Expanded(
            child: searchFilm.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: searchFilm.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    title: Text(searchFilm[index].titleFilm),
                                  ),
                                  body: Hero(
                                    tag: "Film",
                                    child: Center(
                                      child: Image(
                                          image: NetworkImage(
                                              searchFilm[index].imagesFilm[1])),
                                    ),
                                  ),
                                ),
                              ));
                        },
                        child: MyCard(
                          titleFilm: searchFilm[index].titleFilm,
                          posterFilm: searchFilm[index].posterFilm,
                          languageFilm: searchFilm[index].languageFilm,
                          genreFilm: searchFilm[index].genreFilm,
                          plotFilm: searchFilm[index].plotFilm,
                          releasedFilm: searchFilm[index].releasedFilm,
                          imageFilm: searchFilm[index].imagesFilm,
                        ),
                      );
                    },
                  ))
        // Expanded(
        //   child: Container(
        //     child: usersSearchedList.length == 0
        //         ? Center(
        //             child: Text("No record found"),
        //           )
        //         : ListView.builder(
        //             itemCount: usersSearchedList.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               return MyCard();
        // Card(
        //   child: ListTile(
        //     leading: Hero(
        //         tag: "user-profile",
        //         child: GestureDetector(
        //             onTap: () {
        //               Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (BuildContext context) =>
        //                       Scaffold(
        //                         appBar: AppBar(
        //                           title: const Text("User detail"),
        //                         ),
        //                         body: Hero(
        //                             tag: "user-profile",
        //                             child: Center(
        //                               child: SizedBox(
        //                                 height: 300,
        //                                 width: 300,
        //                                 child: Image(
        //                                     image: AssetImage(
        //                                         "./images/pic1.jpg")),
        //                               ),
        //                             )),
        //                       )));
        //             },
        //             child: Image(
        //                 image: AssetImage(
        //                     usersSearchedList[index].Image)))),
        //     title: Text(usersSearchedList[index].userName),
        //     subtitle: Text(usersSearchedList[index].userDepartment),
        //   ),
        // );
        //  },
        //  ),
        //  ),
        //  ),
      ]),
    );
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
}
