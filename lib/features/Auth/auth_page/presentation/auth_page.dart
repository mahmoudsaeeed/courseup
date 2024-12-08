import 'package:courseup/features/Auth/Login/presentation/views/my_login_view.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:courseup/features/ViewProfile/presentation/views/my_view_profile.dart';
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
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (state is AuthAuthenticated) {
          // return MyHomeView(
          //   user: state.user!,
          // );
          return const MyViewProfile();
          
        } else if (state is AuthUnAuthenticated) {
          return const MyLoginView();
        } else {
          return const MyLoginView();
        }
      },
    );

    // return BlocListener<AuthCubit, AuthState>(
    //   listener: (context, state) {
    //     if (state is AuthAuthenticated) {
    //       Navigator.pushReplacementNamed(context, MyPages.myHomePage);
    //     } else if (state is AuthError) {
    //       Navigator.pushReplacementNamed(context, MyPages.myLoginPage);
    //     }
    //   },
    // );
  }
}
