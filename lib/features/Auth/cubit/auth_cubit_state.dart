part of 'auth_cubit_cubit.dart';

sealed class AuthCubitState extends Equatable {
  const AuthCubitState();

  @override
  List<Object> get props => [];
}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthCubitLoading extends AuthCubitState {}

final class AuthCubitAuthenticated extends AuthCubitState {
  final User? user;
  const AuthCubitAuthenticated({this.user});
}

final class AuthCubitUnAuthenticated extends AuthCubitState {}

final class AuthCubitError extends AuthCubitState {
  final String message;
  const AuthCubitError({required this.message});
}