import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_list_tile_widget.dart';
import 'package:flutter/material.dart';

class MyViewProfileWidget extends StatelessWidget {
  const MyViewProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 320,
      ),
      child: ListView(
        children: const [
          MyListTileWidget(myIcon: Icons.person_2_outlined, dataName: "Name"),
          MyListTileWidget(myIcon: Icons.email_outlined, dataName: "Email"),
          MyListTileWidget(
              myIcon: Icons.phone_outlined, dataName: "Phone Number"),
          MyListTileWidget(myIcon: Icons.home_outlined, dataName: "Address"),
        ],
      ),
    );
  }
}
