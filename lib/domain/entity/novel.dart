class NovelResult {
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<Novel>? results;

  NovelResult({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory NovelResult.fromMap(Map json) {
    return NovelResult(
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map(
            (e) => Novel.fromMap(e as Map<String, dynamic>),
          )
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Novel {
  final String? name;
  final String? originalName;
  final String? overview;
  final String? firstAirDate;
  final List<String>? originCountries;
  final String? backdropPath;
  final String? posterPath;

  Novel({
    this.name,
    this.originalName,
    this.overview,
    this.firstAirDate,
    this.originCountries,
    this.backdropPath,
    this.posterPath,
  });

  factory Novel.fromMap(Map json) {
    return Novel(
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
