import 'package:flutter/material.dart';

import 'model/users.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  TextEditingController username = TextEditingController();
  List<Users> usersSearchedList = List.from(userList);
  searchUser(String username) {
    setState(() {
      usersSearchedList = userList
          .where((element) =>
              element.userName.toLowerCase().contains(username.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: username,
            decoration: InputDecoration(
                filled: true,
                hintText: "Search",
                suffixIcon: IconButton(
                    onPressed: () {}, icon: Icon(Icons.search_rounded)),
                fillColor: Color.fromARGB(14, 0, 0, 0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                )),
            onChanged: (value) => searchUser(value.toString()),
          ),
        ),
        Container(
          height: 400,
          child: usersSearchedList.length == 0
              ? Center(
                  child: Text("No record found"),
                )
              : ListView.builder(
                  itemCount: usersSearchedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Hero(
                            tag: "user-profile",
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Scaffold(
                                            appBar: AppBar(
                                              title: const Text("User detail"),
                                            ),
                                            body: Hero(
                                                tag: "user-profile",
                                                child: Center(
                                                  child: SizedBox(
                                                    height: 300,
                                                    width: 300,
                                                    child: Image(
                                                        image: AssetImage(
                                                            "./images/pic1.jpg")),
                                                  ),
                                                )),
                                          )));
                                },
                                child: Image(
                                    image: AssetImage(
                                        usersSearchedList[index].Image)))),
                        title: Text(usersSearchedList[index].userName),
                        subtitle: Text(usersSearchedList[index].userDepartment),
                      ),
                    );
                  },
                ),
        ),
      ]),
    );
  }
}
