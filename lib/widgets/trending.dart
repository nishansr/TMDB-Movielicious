import 'package:flutter/material.dart';
import 'package:movieapp/utils/description.dart';
import 'package:movieapp/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: "Trending Movies", color: Colors.white, size: 20),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => Description(
                                name: trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : trending[index]['name'],
                                description: trending[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launch_on: trending[index]['first_air_date']
                                    .toString(),
                              )),
                        ));
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: CustomText(
                                  color: Colors.white,
                                  size: 15,
                                  text: trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : trending[index]['name']),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
