import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '153e7bb8fe1ab4d6624ab21a9906ac10';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNTNlN2JiOGZlMWFiNGQ2NjI0YWIyMWE5OTA2YWMxMCIsInN1YiI6IjY0YmQ0MWYzZWI3OWMyMDBlMjhkYTRlYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VUXCJgzP_6zzM_Ppr5aHGaVROBmfwntpEyix1ZYJ7_g';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
    print(topratedmovies);
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Flutter Movie App ❤️',
          color: Colors.white,
          size: 20,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          TrendingMovies(
            trending: trendingmovies,
          ),
        ],
      ),
    );
  }
}
