class Diziler{
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String firstAirDate;
  final int vote_count;
  final String originalLanguage;
  final double popularity;
  final List<String> originCountry;
  final List<int> genreIds;

  Diziler({required this.id, required this.name, required this.overview, required this.posterPath,
    required this.voteAverage, required this.firstAirDate, required this.vote_count,
    required this.originalLanguage, required this.popularity, required this.originCountry,
    required this.genreIds});

  factory Diziler.fromJson(Map<String, dynamic> json) {
    return Diziler(
      id: json['id'],
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      firstAirDate: json['first_air_date'] ?? '',
      vote_count: json['vote_count'],
      originalLanguage: json['original_language'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      originCountry: List<String>.from(json['origin_country'] ?? []),

    );
  }


}