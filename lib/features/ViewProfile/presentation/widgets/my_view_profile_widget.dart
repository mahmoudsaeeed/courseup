import 'package:courseup/features/ViewProfile/presentation/widgets/my_list_tile_widget.dart';
import 'package:flutter/material.dart';

import '../../../Auth/domain/entities/my_user_entity.dart';

class MyViewProfileWidget extends StatelessWidget {
  const MyViewProfileWidget({super.key, required this.myUser});
  final MyUserEntity myUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 320,
      ),
      child: ListView(
        children: [
          MyListTileWidget(myIcon: Icons.person_2_outlined, dataName: myUser.name),
          MyListTileWidget(myIcon: Icons.email_outlined, dataName: myUser.email),
          MyListTileWidget(
              myIcon: Icons.phone_outlined, dataName: myUser.phoneNumber ?? ""),
          MyListTileWidget(myIcon: Icons.home_outlined, dataName: myUser.address ?? ""),
        ],
      ),
    );
  }
}
