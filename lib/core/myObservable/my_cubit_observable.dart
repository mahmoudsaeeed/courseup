
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubitObservable implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint(
        "||======== cubit before ${change.currentState} and now is ${change.nextState} ============||");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("||===========   cubit ${bloc.state} is closed   =========|| ");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("||===========   cubit ${bloc.state} is created   =========|| ");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("||===========   cubit ${bloc.state} has error   =========|| ");
    debugPrint("||===========   error is $error   =========|| ");
    debugPrint("||===========   the error in $stackTrace   =========|| ");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint("||============   cubit ${bloc.state} make event :  $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint(
        "||============   cubit ${bloc.state} has transition from  ${transition.currentState}  to   ${transition.nextState}");
  }
}
