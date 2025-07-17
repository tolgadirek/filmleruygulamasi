class DizilerDetay {
  final int id;
  final String name;
  final String backdropPath;
  final String firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final List<String> languages;
  final String lastAirDate;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String overview;
  final double popularity;
  final List<String> spokenLanguages;
  final String status;
  final double voteAverage;
  final int voteCount;

  DizilerDetay({
    required this.id, required this.name, required this.backdropPath, required this.firstAirDate, required this.genres,
    required this.homepage, required this.languages, required this.lastAirDate, required this.numberOfEpisodes,
    required this.numberOfSeasons, required this.originCountry, required this.originalLanguage, required this.overview, required this.popularity,
    required this.spokenLanguages, required this.status, required this.voteAverage, required this.voteCount,
  });

  factory DizilerDetay.fromJson(Map<String, dynamic> json) {
    return DizilerDetay(
      id: json['id'],
      name: json['name'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      firstAirDate: json['first_air_date'] ?? '',
      genres: (json['genres'] as List?)?.map((genre) => Genre.fromJson(genre)).toList() ?? [],
      homepage: json['homepage'] ?? '',
      languages: List<String>.from(json['languages'] ?? []),
      lastAirDate: json['last_air_date'] ?? '',
      numberOfEpisodes: json['number_of_episodes'] ?? 0,
      numberOfSeasons: json['number_of_seasons'] ?? 0,
      originCountry: List<String>.from(json['origin_country'] ?? []),
      originalLanguage: json['original_language'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      spokenLanguages: (json['spoken_languages'] as List?)?.map((lang) => lang['name'] ?? '').cast<String>().toList() ?? [],
      status: json['status'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
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