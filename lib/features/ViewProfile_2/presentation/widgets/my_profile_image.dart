import 'package:courseup/constants/images.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/ViewProfile_2/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileImage extends StatelessWidget {
  final MyUserEntity user;
  const MyProfileImage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (MediaQuery.of(context).size.width / 2) - 100,
      top: 130,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ProfileLoading;

          return InkWell(
            onTap: isLoading
                ? null
                : () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      context.read<ProfileCubit>().updateProfileImage(
                            user,
                            pickedFile.path,
                          );
                    }
                  },
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  foregroundImage: user.profileImage != null
                      ? ((state is ProfileUpdated) ? NetworkImage(state.user.profileImage!) : NetworkImage(user.profileImage!))
                      : const AssetImage(hunterBoy),
                  
                ),
                if (isLoading)
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 4.0,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
