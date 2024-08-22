class MovieResult {
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<Movie>? results;

  MovieResult({
    this.page,
    this.totalPages,
    this.totalResults,
    this.results,
  });

  factory MovieResult.fromMap(Map json) {
    return MovieResult(
      page: json['page'],
      results: json['results'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Movie {
  final String? overview;
  final String? posterPath;
  final String? title;

  Movie({
    this.overview,
    this.posterPath,
    this.title,
  });

  factory Movie.fromMap(Map json) {
    return Movie(
      overview: json['overview'],
      posterPath: json['poster_path'],
      title: json['title'],
    );
  }
}
