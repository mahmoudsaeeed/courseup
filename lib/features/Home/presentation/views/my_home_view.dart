import 'package:courseup/core/constants.dart';
import 'package:courseup/features/Auth/sharedPresentation/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeView extends StatelessWidget {
  final User user;
  const MyHomeView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () {
        BlocProvider.of<AuthCubit>(context).logout();
        Navigator.pushReplacementNamed(context, MyPages.myAuthPage);
      }, icon: const Icon(Icons.logout)),),
      body: Center(child: Text("hello, ${user.email}"),),
    );
  }
}
