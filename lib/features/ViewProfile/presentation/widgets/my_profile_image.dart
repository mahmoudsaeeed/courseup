import 'package:courseup/constants/images.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/ViewProfile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileImage extends StatelessWidget {
  final MyUserEntity user;
  const MyProfileImage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (MediaQuery.of(context).size.width / 2) - 80,
      top: 130,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            foregroundImage: user.profileImage != null
                ? NetworkImage(user.profileImage!)
                : const AssetImage(hunterBoy),
          ),
          Positioned(
              left: MediaQuery.sizeOf(context).width / 2 - 80,
              top: 120,
              child: MyChangeImageIcon(
                onPressed: () async {
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    context.read<ProfileCubit>().updateProfileImage(
                          user,
                          pickedFile.path,
                        );
                  }
                },
              )),
        ],
      ),
    );
  }
}

class MyChangeImageIcon extends StatelessWidget {
  const MyChangeImageIcon({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        child: IconButton(
            onPressed: onPressed, icon: const Icon(Icons.camera_alt_outlined)));
  }
}
