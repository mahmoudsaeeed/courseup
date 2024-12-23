import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
import 'package:courseup/features/EditProfile/presentation/widgets/my_ep_form.dart';
import 'package:courseup/features/EditProfile/presentation/widgets/my_ep_save_btn.dart';
import 'package:courseup/features/EditProfile/presentation/widgets/my_ep_top_part.dart';
import 'package:flutter/material.dart';

class MyEditProfileView extends StatefulWidget {
  const MyEditProfileView({super.key});

  @override
  State<MyEditProfileView> createState() => _MyEditProfileViewState();
}

class _MyEditProfileViewState extends State<MyEditProfileView> {
  AppBar appBar = AppBar(
    title: const Text("Edit profile"),
    backgroundColor: Colors.blue,
    centerTitle: true,
  );
  double remained = 0;

  @override
  Widget build(BuildContext context) {

      final arg = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    MyUserEntity myUser = arg['user'];
    
    double height = MediaQuery.of(context).size.height;
    double appBarHeight = appBar.preferredSize.height;
    remained = height - appBarHeight - 60;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: remained,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyEpTopPart(
                myUser: myUser,
              ),
              MyEpForm(
                myUser: myUser,
              ),
              const MyEpSaveBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
