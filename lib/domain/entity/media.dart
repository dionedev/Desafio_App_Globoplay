class MediaResult {
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<Media>? results;

  MediaResult({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MediaResult.fromMap(Map json) {
    return MediaResult(
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map(
            (e) => Media.fromMap(e as Map<String, dynamic>),
          )
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Media {
  final String? name;
  final String? originalName;
  final String? overview;
  final String? firstAirDate;
  final List<String>? originCountries;
  final String? backdropPath;
  final String? posterPath;

  Media({
    this.name,
    this.originalName,
    this.overview,
    this.firstAirDate,
    this.originCountries,
    this.backdropPath,
    this.posterPath,
  });

  factory Media.fromMap(Map json) {
    return Media(
      name: json['name'],
      originalName: json['original_name'],
      overview: json['overview'],
      firstAirDate: json['first_air_date'],
      originCountries: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
    );
  }

  String get fullImageUrl {
    return 'https://image.tmdb.org/t/p/w400${posterPath ?? ''}';
  }
}
