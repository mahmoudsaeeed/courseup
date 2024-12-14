part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileUpdated extends ProfileState {
  final MyUserEntity user;

  const ProfileUpdated({required this.user});
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});
}