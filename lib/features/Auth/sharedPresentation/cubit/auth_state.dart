part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final User? user;
  const AuthAuthenticated({this.user});
}

final class AuthUnAuthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});
}