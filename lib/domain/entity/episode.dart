class EpisodeResult {
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<Episode>? results;

  EpisodeResult({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory EpisodeResult.fromMap(Map json, EpisodeType episodeType) {
    return EpisodeResult(
      page: json['page'],
      results: (json['results'] as List<dynamic>?)
          ?.map(
            (e) => Episode.fromMap(e as Map<String, dynamic>, episodeType),
          )
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Episode {
  final String? title;
  final String? originalTitle;
  final String? name;
  final String? originalName;
  final String? overview;
  final String? firstAirDate;
  final String? releaseDate;
  final List<String>? originCountries;
  final String? originLanguage;
  final String? backdropPath;
  final String? posterPath;
  final EpisodeType episodeType;
  final List<int>? genreIds;

  Episode({
    this.title,
    this.originalTitle,
    this.name,
    this.originalName,
    this.overview,
    this.firstAirDate,
    this.releaseDate,
    this.originCountries,
    this.originLanguage,
    this.backdropPath,
    this.posterPath,
    required this.episodeType,
    this.genreIds,
  });

  factory Episode.fromMap(Map json, EpisodeType episodeType) {
    return Episode(
      title: json['title'],
      originalTitle: json['original_title'],
      name: json['name'],
      originalName: json['original_name'],
      overview: json['overview'],
      firstAirDate: json['first_air_date'],
      releaseDate: json['release_date'],
      originCountries: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originLanguage: json['original_language'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      episodeType: episodeType,
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((element) => element as int)
          .toList(),
    );
  }

  String get fullImageUrl {
    return 'https://image.tmdb.org/t/p/w400${posterPath ?? ''}';
  }
}

enum EpisodeType {
  movie,
  tvShow,
}
