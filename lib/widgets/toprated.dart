import 'package:flutter/material.dart';
import 'package:movieapp/utils/description.dart';
import 'package:movieapp/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: "Top Rated Movies", color: Colors.white, size: 20),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => Description(
                                name: toprated[index]['title'] != null
                                    ? toprated[index]['title']
                                    : toprated[index]['name'],
                                description: toprated[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                                vote:
                                    toprated[index]['vote_average'].toString(),
                                launch_on: toprated[index]['first_air_date']
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
                                          toprated[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: CustomText(
                                  color: Colors.white,
                                  size: 15,
                                  text: toprated[index]['title'] != null
                                      ? toprated[index]['title']
                                      : 'Loading'),
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
