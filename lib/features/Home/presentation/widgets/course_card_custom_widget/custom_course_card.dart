import 'package:flutter/material.dart';

import 'custom_rating_bar.dart';

class CustomCourseCard extends StatelessWidget {
  final String name;
  final String description;
  final int videoNums;
  final String imagePath;
  final int ratingCount;
  final double rating;
  const CustomCourseCard(
      {super.key,
      required this.name,
      required this.description,
      required this.videoNums,
      required this.imagePath,
      required this.ratingCount,
      required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 10),
        height: 150,
        width: 500,
        child: Card(
          color: Colors.white,
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 110,
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 17),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 13, 155, 201),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      const SizedBox(height: 8),
                      RatingBar(
                        rating: rating,
                        ratingCount: ratingCount,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "$videoNums video",
                      style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: 70,
                      child: MaterialButton(
                        textColor: Colors.lightBlue,
                        onPressed: () {},
                        child: const Text("Play"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
