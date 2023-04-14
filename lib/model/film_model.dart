class Films {
  String titleFilm = '';
  String releasedFilm = '';
  String genreFilm = '';
  String plotFilm = '';
  String languageFilm = '';
  String posterFilm = '';
  Films(
      {required this.titleFilm,
      required this.posterFilm,
      required this.languageFilm,
      required this.genreFilm,
      required this.plotFilm,
      required this.releasedFilm});

  factory Films.fromJson(Map<String, dynamic> json) {
    print("Inside Json function===================");
    return Films(
      titleFilm: json['Title'] ?? "No Title",
      posterFilm: json['Poster'] ?? "No Data",
      languageFilm: json['Language'] ?? "No Data",
      genreFilm: json['Genre'] ?? "No Data",
      plotFilm: json['Plot'] ?? "No Data",
      releasedFilm: json['Released'] ?? "No data",
    );
  }
}
