import 'package:courseup/core/utils/my_colors.dart';
import 'package:courseup/features/Search/presentation/widgets/my_search_widget.dart';
import 'package:flutter/material.dart';

class MyMainAppBar extends StatelessWidget {
  const MyMainAppBar(
      {super.key,
      required this.myBody,
      this.myFloatingButton,
      this.myFloatingButtonLocation});
  final Widget myBody;
  final Widget? myFloatingButton;
  final FloatingActionButtonLocation? myFloatingButtonLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
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
        ),
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
      body: InkWell(
          onTap: () {
            FocusScopeNode currNode = FocusScope.of(context);
            if (currNode.focusedChild != null && !currNode.hasPrimaryFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: SingleChildScrollView(child: myBody)),
      floatingActionButton: myFloatingButton,
      floatingActionButtonLocation: myFloatingButtonLocation,
    );
  }
}
