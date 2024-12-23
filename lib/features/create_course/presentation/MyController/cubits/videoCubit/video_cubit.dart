import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<List<String?>> {
  VideoCubit() : super([]);
  void addVideo(List<String?> videoPaths) {
    emit([...videoPaths, ...state]);
    log(videoPaths.toString());
    log(state.length.toString());
  }
  void removeVideo(int index) {
    List<String?> videoPaths = List<String?>.from(state);
    videoPaths.removeAt(index);
    emit(videoPaths);
  }
  
  List<String?>? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
  
  Map<String, dynamic>? toJson(List<String?> state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
