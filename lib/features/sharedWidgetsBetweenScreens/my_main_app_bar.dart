import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/Search/presentation/widgets/my_search_widget.dart';
import 'package:flutter/material.dart';

class MyMainAppBar extends StatelessWidget {
  const MyMainAppBar({super.key, required this.myBody});
  final Widget myBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Courseup",
              ),
              MySearchWidget()
            ],
          ),
        )),
        backgroundColor: MyColors.mySecondaryColor,
        actionsIconTheme: IconThemeData(
          color: MyColors.myThirdColor,
        ),
        // actions: const [
        //   MySearchWidget(),
        //   // IconButton(onPressed: (){}, icon: Icons.notification)
        // ],
      ),
      // drawer: const Drawer(),
      body: myBody,
    );
  }
}
