import 'package:app_movie/domain/entity/movie.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final String carouselTitle;
  final List<Movie> movies;
  final void Function() onNavigate;

  const Carousel({
    super.key,
    required this.carouselTitle,
    required this.movies,
    required this.onNavigate,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.carouselTitle,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (buildContext, int index) {
              final movie = widget.movies[index];
              return GestureDetector(
                onTap: widget.onNavigate,
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(
                    movie.fullImageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
