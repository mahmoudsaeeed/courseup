import 'package:courseup/features/ViewProfile/presentation/widgets/my_vp_bottom_action_dashboard.dart';
import 'package:courseup/features/ViewProfile/presentation/widgets/my_vp_top_info_row.dart';
import 'package:courseup/features/ViewProfile/presentation/widgets/my_vp_user_dashboard.dart';
import 'package:flutter/material.dart';

class MyViewProfile extends StatefulWidget {
  const MyViewProfile({super.key});

  @override
  State<MyViewProfile> createState() => _MyViewProfileState();
}

class _MyViewProfileState extends State<MyViewProfile> {
  AppBar appBar = AppBar(
    title: const Text("My profile"),
    backgroundColor: Colors.blue,
    centerTitle: true,
  );
  double remained = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double appBarHeight = appBar.preferredSize.height;
    remained = height - appBarHeight - 60;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: remained,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyVpTopInfoRow(),
              MyVpUserDashboard(),
              MyVpBottomActionDashboard(),
            ],
          ),
        ),
      ),
    );
  }
}
