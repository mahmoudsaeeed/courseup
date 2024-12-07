import 'package:courseup/features/Auth/Login/presentation/views/my_login_view.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:courseup/features/Home/presentation/views/my_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (state is AuthAuthenticated) {
            return MyHomeView(user: state.user!,);
          } else if (state is AuthUnAuthenticated) {
            return const MyLoginView();
          } else {
            return Container();
          }
        },
    );
  }
}
