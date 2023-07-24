import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;
  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Container(
              height: 270,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(bannerurl, fit: BoxFit.cover)),
                  )),
                  Positioned(
                    left: 20,
                    bottom: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: 'Average Rating - ' + vote,
                            color: Colors.white,
                            size: 15),
                        Container(
                          child: CustomText(
                              text: name != null ? name : 'Loading',
                              color: Colors.white,
                              size: 25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: CustomText(
                  text: launch_on != null
                      ? 'Released On : ' + launch_on
                      : 'Released On : ' + 'Loading',
                  color: Colors.white,
                  size: 15),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: CustomText(
                      text: description,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
