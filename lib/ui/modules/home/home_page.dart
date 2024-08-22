import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listaTeste = [
    'https://upload.wikimedia.org/wikipedia/en/b/b4/At-the-movies.jpg',
    'https://greenhouse.hulu.com/app/uploads/sites/11/MazeRunner_Hulu_600x338_cp.jpg',
    'https://upload.wikimedia.org/wikipedia/en/b/b4/At-the-movies.jpg',
    'https://upload.wikimedia.org/wikipedia/en/b/b4/At-the-movies.jpg',
    'https://upload.wikimedia.org/wikipedia/en/b/b4/At-the-movies.jpg',
  ];

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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Novelas',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listaTeste.length,
                itemBuilder: (BuildContext _, int index) {
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.network(
                      listaTeste[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
