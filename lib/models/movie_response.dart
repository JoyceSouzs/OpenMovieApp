class MovieResponse {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;
  String runtime;
  String plot;
  String actors;
  String director;
  String production;

  MovieResponse.fromMappedJson(Map<String, dynamic> json) {
    title = json['Title'] ?? "";
    year = json['Year'] ?? "";
    imdbID = json['imdbID'] ?? "";
    type = json['Type'] ?? "";
    poster = json['Poster'] ?? "";
    runtime = json['Runtime'] ?? "";
    plot = json['Plot'] ?? "";
    actors = json['Actors'] ?? "";
    director = json['Director'] ?? "";
    production = json['Production'] ?? "";

    print("");
  }
}
