import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:app_movie/domain/entity/movie.dart';

class RemoteLoadMovies {
  Future<MovieResult?> load() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1');
    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MTUwNGI0YjY0OGMwMGUwNGZlMDUzYWY2YmYxZTI5OCIsIm5iZiI6MTcyNDIwMTA4MC4xNzE3ODEsInN1YiI6IjY2YzUxMjZlNDZkYzkyN2M3ZGQxMGY1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Kpa90tog53_qBWPqD9s5MB9sWU659K7WChxrdQBhPQw'
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map;
      return MovieResult.fromMap(jsonResponse);
    } else {
      return null;
    }
  }
}
