import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/ViewProfile/presentation/widgets/my_background_radius.dart';
import 'package:courseup/features/ViewProfile/presentation/widgets/my_profile_image.dart';
import 'package:courseup/features/ViewProfile/presentation/widgets/my_view_profile_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/my_edit_button.dart';

class MyViewProfile extends StatelessWidget {
  const MyViewProfile({super.key, required this.myUser});
  final MyUserEntity myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MyEditButton(myUser:myUser),
          MyViewProfileWidget(myUser: myUser),
          const MyBackgroundRadius(),
          const MyProfileImage(),
        ],
      ),
    );
  }
}
