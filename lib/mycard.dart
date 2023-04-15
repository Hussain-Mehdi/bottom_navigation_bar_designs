import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  String titleFilm;
  String releasedFilm;
  String genreFilm;
  String plotFilm;
  String languageFilm;
  String posterFilm;
  List<String> imageFilm;
  MyCard(
      {super.key,
      required this.titleFilm,
      required this.posterFilm,
      required this.languageFilm,
      required this.genreFilm,
      required this.plotFilm,
      required this.releasedFilm,
      required this.imageFilm});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 5),
      child: Ink(
        height: 150,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(22, 12, 12, 12),
              spreadRadius: 1.4,
              offset: Offset(1, 2),
              blurRadius: 1),
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              height: 170,
              width: 130,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: FadeInImage.assetNetwork(
                  placeholder: './images/placeholder.gif',
                  image: imageFilm[1],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 210,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, bottom: 3),
                    child: Text(
                      titleFilm,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(183, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      height: 55,
                      child: Text(
                        plotFilm,
                        style: const TextStyle(
                          color: Color.fromARGB(183, 0, 0, 0),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 3,
                    ),
                    child: Text(
                      "Genre:\t\t\t$genreFilm",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(183, 0, 0, 0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "Release Date:\t\t$releasedFilm",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(99, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
