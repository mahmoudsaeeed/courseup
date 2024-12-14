import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:courseup/features/ViewProfile_2/data/repository/user_profile_repo_impl.dart';
import 'package:courseup/features/ViewProfile_2/data/services/cloudinary_service.dart';
import 'package:courseup/features/ViewProfile_2/presentation/cubit/profile_cubit.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_background_radius.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_profile_image.dart';
import 'package:courseup/features/ViewProfile_2/presentation/widgets/my_view_profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/my_edit_button.dart';

class MyViewProfile extends StatelessWidget {
  const MyViewProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(
          userRepository: UserProfileRepoImpl(
            firestore: FirebaseFirestore.instance,
            cloudinaryService: CloudinaryService(),
          ),
        )..fetchUserData(FirebaseAuth.instance.currentUser!.uid),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileSuccess) {
              return Stack(
                children: [
                  const MyBackgroundRadius(),
                  MyProfileImage(
                    user: state.user,
                  ),
                  MyViewProfileWidget(user: state.user,),
                  const MyEditButton(),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).logout();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is ProfileError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('Unknown error'),
              );
            }
          },
        ),
      ),
    );
  }
}
