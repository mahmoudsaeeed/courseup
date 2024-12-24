part of 'video_cubit.dart';

sealed class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

final class AddVideoInitial extends VideoState {}
