class GenresResult {
  final List<Genre>? genres;

  GenresResult({
    this.genres,
  });

  factory GenresResult.fromMap(Map json) {
    return GenresResult(
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class Genre {
  final int? id;
  final String? name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromMap(Map json) {
    return Genre(id: json['id'], name: json['name']);
  }
}
