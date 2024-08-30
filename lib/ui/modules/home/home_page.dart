import 'package:app_movie/data/usecase/remote_load_media.dart';
import 'package:app_movie/ui/components/carousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteLoadMedia remoteLoadMedia = RemoteLoadMedia();
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(
        context,
        '/details',
        arguments: () {
          setState(() {
            selectedIndex = 0;
          });
        },
      ); // CORRIGIR O NOME DA PAGINA
    }
  }

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
      backgroundColor: const Color.fromRGBO(14, 14, 14, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              FutureBuilder(
                future: remoteLoadMedia.load(),
                builder: (context, snapshot) {
                  final movies = snapshot.data?.results;
                  return Carousel(
                    carouselTitle: 'Filmes',
                    items:
                        movies?.map((item) => item.fullImageUrl).toList() ?? [],
                    onNavigate: (int index) {
                      Navigator.pushNamed(context, '/details',
                          arguments: movies?[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromRGBO(4, 4, 4, 1),
        selectedItemColor: const Color.fromRGBO(250, 250, 250, 1),
        unselectedItemColor: const Color.fromRGBO(92, 92, 92, 1),
        iconSize: 32,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Minha lista'),
        ],
      ),
    );
  }
}
