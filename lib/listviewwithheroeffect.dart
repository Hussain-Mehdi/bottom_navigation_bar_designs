import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Card(
          child: ListTile(
            leading: Hero(
                tag: "user-profile",
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Scaffold(
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
                    child: Image(image: AssetImage("./images/pic1.jpg")))),
            title: const Text("Usernname"),
            subtitle: const Text("Write any description here"),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.add_rounded)),
          ),
        ));
  }
}
