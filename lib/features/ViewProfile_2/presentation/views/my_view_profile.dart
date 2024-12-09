import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_background_radius.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_profile_image.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_view_profile_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/my_edit_button.dart';

class MyViewProfile extends StatelessWidget {
  const MyViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          MyEditButton(),
          MyViewProfileWidget(),
          MyBackgroundRadius(),
          MyProfileImage(),
        ],
      ),
    );
  }
}
