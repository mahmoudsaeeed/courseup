import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/ViewProfile/data/repository/user_profile_repo_impl.dart';
import 'package:courseup/features/ViewProfile/data/services/cloudinary_service.dart';
import 'package:courseup/features/ViewProfile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/my_background_radius.dart';
import '../widgets/my_edit_button.dart';
import '../widgets/my_profile_image.dart';
import '../widgets/my_view_profile_widget.dart';

class MyViewProfile extends StatelessWidget {
  final MyUserEntity user;
  const MyViewProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MyEditButton(myUser: user,),
          MyViewProfileWidget(
            myUser: user,
          ),
          const MyBackgroundRadius(),
          BlocProvider(
            create: (context) => ProfileCubit(
              userRepository: UserProfileRepoImpl(
                firestore: FirebaseFirestore.instance,
                cloudinaryService: CloudinaryService(),
              ),
            ),
            child: MyProfileImage(
              user: user,
            ),
          ),
        ],
      ),
    );
  }
}
