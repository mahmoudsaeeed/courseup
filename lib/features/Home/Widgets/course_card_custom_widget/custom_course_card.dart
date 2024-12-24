import 'package:flutter/material.dart';

import 'custom_rating_bar.dart';

class Course extends StatelessWidget {
  final String Name;
  final String Description;
  final int VideoNums;
  final String ImagePath;
  final int ratingCount;
  final double rating;
  const Course({super.key, required this.Name, required this.Description, required this.VideoNums, required this.ImagePath, required this.ratingCount, required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10),
        height: 150,
        width: 500,
        child:
        Card(
          color: Colors.white,
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 110,
                  child: Image.network(
                    "$ImagePath",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 17),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$Name",
                        style: TextStyle(
                          color: Color(0xfff0D9BC9),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "$Description",
                        style: TextStyle(color: Colors.grey,fontSize: 10),
                      ),
                      SizedBox(height: 8),
                      RatingBar(
                        rating: rating,
                        ratingCount: ratingCount,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("$VideoNums video",style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 11,
                    ),),
                    SizedBox(height:3),
                    Container(
                      width: 70,
                      child: MaterialButton(
                        textColor: Colors.lightBlue,
                        onPressed: () {},
                        child: Text("Play"),
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