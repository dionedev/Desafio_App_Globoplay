import 'package:app_movie/data/usecase/remote_load_movies.dart';
import 'package:app_movie/data/usecase/remote_load_tv_show.dart';
import 'package:app_movie/ui/components/carousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteLoadMovies remoteLoadMovies = RemoteLoadMovies();
  RemoteLoadTvShow remoteLoadTvShow = RemoteLoadTvShow();
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(
        context,
        '/mylist',
      );
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
                future: remoteLoadMovies.load(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    debugPrint('Erro ao carregar filmes: ${snapshot.error}');
                    return const Text('');
                  } else if (!snapshot.hasData ||
                      snapshot.data?.results?.isEmpty == true) {
                    debugPrint('Nenhum filme encontrado');
                    return const Text('');
                  } else {
                    final episode = snapshot.data?.results;
                    final images =
                        episode?.map((item) => item.fullImageUrl).toList() ??
                            [];

                    return Carousel(
                      carouselTitle: 'Filmes',
                      items: images,
                      onNavigate: (int index) {
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: {
                            'episode': episode?[index],
                            'images': images,
                          },
                        );
                      },
                    );
                  }
                },
              ),
              FutureBuilder(
                future: remoteLoadTvShow.load(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    debugPrint(
                        'Erro ao carregar programas de tv: ${snapshot.error}');
                    return const Text('');
                  } else if (!snapshot.hasData ||
                      snapshot.data?.results?.isEmpty == true) {
                    debugPrint('Nenhum programas de tv encontrado');
                    return const Text('');
                  } else {
                    final episode = snapshot.data?.results;
                    final images =
                        episode?.map((item) => item.fullImageUrl).toList() ??
                            [];

                    return Carousel(
                      carouselTitle: 'TV',
                      items: images,
                      onNavigate: (int index) {
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: {
                            'episode': episode?[index],
                            'images': images,
                          },
                        );
                      },
                    );
                  }
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
