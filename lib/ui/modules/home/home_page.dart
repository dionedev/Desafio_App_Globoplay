import 'package:app_movie/data/usecase/remote_load_movies.dart';
import 'package:app_movie/ui/components/carousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteLoadMovies remoteLoadMovies = RemoteLoadMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(4, 4, 4, 1),
        title: Image.asset(
          'lib/ui/assets/images/globoplay.png',
          color: const Color.fromRGBO(255, 255, 255, 1),
          width: 150,
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: remoteLoadMovies.load(),
            builder: (context, snapshot) {
              final movies = snapshot.data?.results;
              return Carousel(
                carouselTitle: 'Filmes',
                movies: movies ?? [],
                onNavigate: () {
                  print('Card clicado');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
