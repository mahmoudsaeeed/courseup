import 'package:courseup/core/constants.dart';
import 'package:flutter/material.dart';

class MyVpTopInfoRow extends StatelessWidget {
  const MyVpTopInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    // User? currUser = FirebaseAuth.instance.currentUser;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CircleAvatar(
            // child: Image(image: ),
            // ),
            radius: 50,
            child: Text("MA"), //TODO image from db
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Person Name",
                style: MyCustomFonts.largerText,
              ), //TODO name from db
              Text(
                "jop title",
                style: MyCustomFonts.smallText,
              ), //TODO jop from db
              // Text(currUser!.displayName!),
            ],
          ),
          IconButton(
            onPressed: () {
              debugPrint(
                  "--------  Navigate to edit profile page  --------------");
              Navigator.pushNamed(context, "editProfile");
            },
            icon: const Icon(Icons.border_color_rounded),
          )
        ],
      ),
    );
  }
}
