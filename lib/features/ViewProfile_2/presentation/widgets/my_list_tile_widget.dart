import 'package:flutter/material.dart';

class MyListTileWidget extends StatelessWidget {
  const MyListTileWidget({
    super.key,
    required this.myIcon,
    required this.dataName,
  });
  final IconData myIcon;
  final String dataName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 8,
                child: SizedBox(
                  child: ListTile(
                    minLeadingWidth: 20,
                    horizontalTitleGap: 14,
                    leading: Icon(myIcon),
                    title: Text(dataName),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
