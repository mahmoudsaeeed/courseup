import 'package:flutter/material.dart';

import 'custom_clipper.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final int ratingCount;
  RatingBar({required this.rating, required this.ratingCount, this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];

    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(Icons.star, color: Colors.yellow, size: size));
        // _starList.add(Icon(Icons.star, color: Theme.of(context).primaryColor, size: size));
      } else if (i == realNumber) {
        _starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //  Icon(Icons.star, color: Theme.of(context).primaryColor, size: size),
              Icon(Icons.star, color: Colors.yellow, size: size),
              ClipRect(
                clipper: Clipper(part: partNumber),
                child: Icon(Icons.star, color: Colors.grey, size: size),
              )
            ],
          ),
        ));
      } else {
        _starList.add(Icon(Icons.star, color: Colors.grey, size: size));
      }
    }
    ratingCount != null ? _starList.add(Padding(
        padding: EdgeInsets.only(left:10),
        child: Text('($ratingCount)', style: TextStyle(
            fontSize: size*0.7, color: Theme.of(context).disabledColor)
        )),
    ) : SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}
