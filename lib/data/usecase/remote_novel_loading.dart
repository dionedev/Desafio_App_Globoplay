import 'package:app_movie/domain/entity/novel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RemoteNovelLoading {
  load() async {
    final url = Uri.parse('https://api.themoviedb.org/3/discover/tv');
    final response = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MTUwNGI0YjY0OGMwMGUwNGZlMDUzYWY2YmYxZTI5OCIsIm5iZiI6MTcyNDc4NDU0MC4wNjExMjcsInN1YiI6IjY2YzUxMjZlNDZkYzkyN2M3ZGQxMGY1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aeLhZvi68tjy9GXLbocXdhEC9t8NZ9bd561JqVPEylc'
    });

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map;
      return Novel.fromMap(jsonResponse);
    } else {
      return null;
    }
  }
}
