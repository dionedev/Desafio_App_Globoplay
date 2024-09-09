import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final String carouselTitle;
  final List<String> items;
  final void Function(int index) onNavigate;

  const Carousel({
    super.key,
    required this.carouselTitle,
    required this.items,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 16),
            child: Text(
              carouselTitle,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(246, 246, 246, 1),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (buildContext, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    onNavigate(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.network(item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
