class Films {
  String titleFilm;
  String releasedFilm;
  String genreFilm;
  String plotFilm;
  String languageFilm;
  String posterFilm;
  List<String> imagesFilm;

  Films(
      {required this.titleFilm,
      required this.posterFilm,
      required this.languageFilm,
      required this.genreFilm,
      required this.plotFilm,
      required this.releasedFilm,
      required this.imagesFilm});

  factory Films.fromJson(Map<String, dynamic> json) {
    return Films(
        titleFilm: json['Title'].toString(),
        posterFilm: json['Poster'].toString(),
        languageFilm: json['Language'].toString(),
        genreFilm: json['Genre'].toString(),
        plotFilm: json['Plot'].toString(),
        releasedFilm: json['Released'].toString(),
        imagesFilm: List.from(json['Images']));
  }
}

List<Films> filmList = [];
