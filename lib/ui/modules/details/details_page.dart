import 'dart:ui';

import 'package:app_movie/data/usecase/remote_load_genres.dart';
import 'package:app_movie/domain/entity/episode.dart';
import 'package:app_movie/domain/entity/genres.dart';
import 'package:app_movie/ui/components/technical_sheet.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  RemoteLoadGenres remoteLoadGenres = RemoteLoadGenres();

  bool isWatchMoreButtonSelected = true;
  bool isDetailsButtonSelected = false;
  void onEpisodeOptions() {
    setState(() {
      isWatchMoreButtonSelected = true;
      isDetailsButtonSelected = false;
    });
  }

  void onEpisodeDetails() {
    setState(() {
      isDetailsButtonSelected = true;
      isWatchMoreButtonSelected = false;
    });
  }

  void addMyList() {}

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final Episode? episode = args?['episode'] as Episode?;
    final List<String>? images = args?['images'] as List<String>?;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 14, 14, 1),
      body: Column(
        children: [
          Container(
            height: 600,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(episode?.fullImageUrl ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(1),
                      ],
                      stops: const [0.2, 0.7],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.network(
                        episode?.fullImageUrl ?? '',
                        height: 210,
                        width: 150,
                      ),
                      Text(
                        episode?.episodeType == EpisodeType.movie
                            ? episode?.originalTitle ?? ''
                            : episode?.originalName ?? '',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(251, 251, 251, 1),
                        ),
                      ),
                      const Text(
                        'Filme',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(154, 154, 154, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 28),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            episode?.overview ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(154, 154, 154, 1),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 182,
                              height: 46,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(248, 248, 248, 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow_rounded,
                                    size: 34,
                                    color: Color.fromRGBO(62, 62, 62, 1),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'Assista',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(62, 62, 62, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              addMyList();
                            },
                            child: Container(
                              width: 182,
                              height: 46,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: const Color.fromRGBO(154, 154, 154, 1),
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 28,
                                    color: Color.fromRGBO(154, 154, 154, 1),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Minha lista',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(154, 154, 154, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onEpisodeOptions,
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: isWatchMoreButtonSelected
                                        ? const Color.fromRGBO(248, 248, 248, 1)
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'ASSISTA TAMBÉM',
                                  style: TextStyle(
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: onEpisodeDetails,
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: isDetailsButtonSelected
                                        ? const Color.fromRGBO(248, 248, 248, 1)
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'DETALHES',
                                  style: TextStyle(
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          isWatchMoreButtonSelected
              ? Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          child: Image.network(
                            images![index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 24, right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Ficha técnica',
                            style: TextStyle(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FutureBuilder(
                          future: remoteLoadGenres.load(),
                          builder: (context, snapshot) {
                            final genreNames = episode?.genreIds
                                ?.map((genreId) {
                                  return snapshot.data?.genres
                                      ?.firstWhere(
                                        (genre) => genre.id == genreId,
                                        orElse: () => Genre(),
                                      )
                                      .name;
                                })
                                .where((name) => name != null)
                                .toList();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TechnicalSheet(
                                  label: 'Título Original',
                                  value:
                                      episode?.episodeType == EpisodeType.movie
                                          ? episode?.originalTitle
                                          : episode?.originalName,
                                ),
                                TechnicalSheet(
                                  label: 'Gênero',
                                  value: genreNames?.join(', '),
                                ),
                                TechnicalSheet(
                                  label: 'Ano de produção',
                                  value:
                                      episode?.episodeType == EpisodeType.movie
                                          ? episode?.releaseDate
                                          : episode?.firstAirDate,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
