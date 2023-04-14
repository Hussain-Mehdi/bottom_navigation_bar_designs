class Films {
  String title;
  String released;
  String genre;
  String plot;
  String language;
  String poster;
  Films(
      {required this.title,
      required this.poster,
      required this.language,
      required this.genre,
      required this.plot,
      required this.released});

  factory Films.fromJson(Map<String, dynamic> json) {
    return Films(
        title: json['title'],
        poster: json['poster'],
        language: json['language'],
        genre: json['genre'],
        plot: json['plot'],
        released: json['released']);
  }
}
