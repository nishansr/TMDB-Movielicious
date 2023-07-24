import 'package:flutter/material.dart';
import 'package:movieapp/utils/description.dart';
import 'package:movieapp/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: "TV Shows", color: Colors.white, size: 20),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => Description(
                                name: tv[index]['title'] != null
                                    ? tv[index]['title']
                                    : tv[index]['name'],
                                description: tv[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['poster_path'],
                                vote: tv[index]['vote_average'].toString(),
                                launch_on: tv[index]['first_air_date'].toString(),
                              )),
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              width: 250,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['backdrop_path']),
                                ),
                              ),
                            ),
                            Container(
                              child: CustomText(
                                  color: Colors.white,
                                  size: 15,
                                  text: tv[index]['name'] != null
                                      ? tv[index]['name']
                                      : 'Loading'),
                            ), 
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
