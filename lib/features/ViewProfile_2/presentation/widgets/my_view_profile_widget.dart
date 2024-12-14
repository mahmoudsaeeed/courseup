import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_list_tile_widget.dart';
import 'package:flutter/material.dart';

class MyViewProfileWidget extends StatelessWidget {
  final MyUserEntity user;
  const MyViewProfileWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 320,
      ),
      child: ListView(
        children: [
          MyListTileWidget(myIcon: Icons.person_2_outlined, dataName: user.name),
          MyListTileWidget(myIcon: Icons.email_outlined, dataName: user.email),
          MyListTileWidget(
              myIcon: Icons.phone_outlined, dataName: user.phoneNumber ?? ''),
          MyListTileWidget(myIcon: Icons.home_outlined, dataName: user.address ?? ''),
        ],
      ),
    );
  }
}
