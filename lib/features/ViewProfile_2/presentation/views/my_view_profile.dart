import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/ViewProfile_2/data/repository/user_profile_repo_impl.dart';
import 'package:courseup/features/ViewProfile_2/data/services/cloudinary_service.dart';
import 'package:courseup/features/ViewProfile_2/presentation/cubit/profile_cubit.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_background_radius.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_profile_image.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_view_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/my_edit_button.dart';

class MyViewProfile extends StatelessWidget {
  final MyUserEntity user;
  const MyViewProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MyEditButton(),
          MyViewProfileWidget(
            user: user,
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
