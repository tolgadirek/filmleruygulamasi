class Filmler{
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String release_date;
  final int vote_count;
  final String originalLanguage;
  final double popularity;
  final List<int> genreIds;

  Filmler({required this.id, required this.title, required this.overview, required this.posterPath,
    required this.voteAverage, required this.release_date, required this.vote_count,
    required this.originalLanguage, required this.popularity, required this.genreIds});

  factory Filmler.fromJson(Map<String, dynamic> json) {
    return Filmler(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      release_date: json['release_date'] ?? '',
      vote_count: json['vote_count'],
      originalLanguage: json['original_language'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }


}