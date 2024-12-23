import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'add_video_state.dart';

class AddVideoCubit extends Cubit<List<String?>> {
  AddVideoCubit() : super([]);
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
  
  @override
  List<String?>? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
  
  @override
  Map<String, dynamic>? toJson(List<String?> state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
