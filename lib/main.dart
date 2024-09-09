import 'package:app_movie/ui/modules/details/details_page.dart';
import 'package:app_movie/ui/modules/home/home_page.dart';
import 'package:app_movie/ui/modules/mylist/my_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ui/modules/splash/splash_page.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
        '/mylist': (context) => const MyListPage(),
      },
    );
  }
}
