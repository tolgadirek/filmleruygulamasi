class FilmlerDetay {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final double voteAverage;
  final voteCount;
  final List<Genre> genres;
  final int runtime;
  final String belongToCollection;
  final int budget;
  final String homepage;
  final String originalLanguage;
  final String popularity;
  final String releaseDate;
  final String status;

  FilmlerDetay({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.runtime,
    required this.belongToCollection,
    required this.budget,
    required this.homepage,
    required this.originalLanguage,
    required this.popularity,
    required this.releaseDate,
    required this.status,
  });

  factory FilmlerDetay.fromJson(Map<String, dynamic> json) {
    return FilmlerDetay(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      genres: (json['genres'] as List<dynamic>?)?.map((g) => Genre.fromJson(g)).toList() ?? [],
      runtime: json['runtime'] ?? 0,
      belongToCollection: json['belongs_to_collection']?['name'] ?? '',
      budget: json['budget'] ?? 0,
      homepage: json['homepage'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      popularity: json['popularity'].toString(),
      releaseDate: json['release_date'] ?? '',
      status: json['status'] ?? '',
    );
  }
}


class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) =>
  Genre(id: json['id'], name: json['name'] ?? '');
}