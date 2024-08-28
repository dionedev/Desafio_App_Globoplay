import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final String carouselTitle;
  final List<String> items;

  final void Function() onNavigate;

  const Carousel({
    super.key,
    required this.carouselTitle,
    required this.items,
    required this.onNavigate,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState<T> extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            widget.carouselTitle,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(246, 246, 246, 1),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (buildContext, index) {
              final item = widget.items[index];
              return GestureDetector(
                onTap: widget.onNavigate,
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(item),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
