import 'package:courseup/core/constants.dart';
import 'package:flutter/material.dart';

class MyVpDashboardRow extends StatelessWidget {
  const MyVpDashboardRow({
    super.key,
    required this.myIcon,
    required this.myPartName,
    required this.onTap,
    this.bgColor,
  });
  final Icon myIcon;
  final String myPartName;
  final Color? bgColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: onTap,
        title: Text(
          myPartName,
          style: MyCustomFonts.mediumBoldText,
        ),
        leading: CircleAvatar(
          backgroundColor: bgColor,
          radius: 30,
          child: myIcon,
        ),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
