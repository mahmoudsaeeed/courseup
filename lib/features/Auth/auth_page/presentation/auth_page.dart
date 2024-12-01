import 'package:courseup/features/Auth/Login/presentation/views/my_login_view.dart';
import 'package:courseup/features/Auth/cubit/auth_cubit.dart';
import 'package:courseup/features/Home/presentation/views/my_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthInitial || state is AuthUnAuthenticated) {
          return const MyLoginView();
        } else if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthAuthenticated) {
          return MyHomeView(username: state.user!.uid);
        } else {
          return const Center(child: Text('Unknown Error'),); // Fallback for unexpected states
        }
      },
    );
  }
}
