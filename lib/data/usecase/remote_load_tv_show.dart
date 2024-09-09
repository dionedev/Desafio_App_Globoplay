import 'package:app_movie/domain/entity/episode.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RemoteLoadTvShow {
  Future<EpisodeResult?> load() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc');
    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MTUwNGI0YjY0OGMwMGUwNGZlMDUzYWY2YmYxZTI5OCIsIm5iZiI6MTcyNTI4OTIyNS40MTY4NzYsInN1YiI6IjY2YzUxMjZlNDZkYzkyN2M3ZGQxMGY1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JeBfyUi8bnusSrEJn0epO3d5KNyumR7A1nYq6qJuYoI'
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map;
      return EpisodeResult.fromMap(jsonResponse, EpisodeType.tvShow);
    } else {
      return throw Exception('Deu ruim aqui');
    }
  }
}
