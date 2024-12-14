import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/ViewProfile/domain/user_profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserProfileRepo _userRepository;

  ProfileCubit({required UserProfileRepo userRepository})
      : _userRepository = userRepository,
        super(ProfileInitial());

  Future<void> updateProfileImage(MyUserEntity user, String imagePath) async {
    emit(ProfileLoading());

      final response = await _userRepository.updateUserProfileImage(user, imagePath);

      response.fold((success) async {
        log('profile uploaded successfully');
        final result = await _userRepository.getUserData(user.userId);
        result.fold((userEntity) {
          log('user updated successfully');
          emit(ProfileUpdated(user: userEntity.value));
        }, (error) {
          log('error: user haven\'t been updated');
          emit(ProfileError(message: error.toString()));
        });

      }, (error) {
        log('profile image couldn\'t have uploaded');
        emit(ProfileError(message: error.toString()));
      });
  }
}
