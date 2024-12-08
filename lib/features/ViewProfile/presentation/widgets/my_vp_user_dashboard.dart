import 'package:courseup/core/constants.dart';
import 'package:courseup/features/ViewProfile/presentation/widgets/my_vp_dashboard_row.dart';
import 'package:flutter/material.dart';

class MyVpUserDashboard extends StatelessWidget {
  const MyVpUserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dashboard",
            style: MyCustomFonts.smallText,
          ),
          Column(
            children: [
              MyVpDashboardRow(
                myIcon: const Icon(Icons.privacy_tip),
                myPartName: "Payments",
                bgColor: Colors.green,
                onTap: () {
                  debugPrint("Surprize 😍😍😍");
                },

                //TODO dashboard of users
              ),
              MyVpDashboardRow(
                myIcon: const Icon(
                  Icons.privacy_tip,
                ),
                myPartName: "Privacy",
                bgColor: Colors.amber,
                onTap: () {
                  debugPrint("Surprize 😍😍😍");
                },

                //TODO dashboard of users
              ),
              MyVpDashboardRow(
                myIcon: const Icon(Icons.privacy_tip),
                myPartName: "Achievements",
                onTap: () {
                  debugPrint("Surprize 😍😍😍");
                },

                //TODO dashboard of users
              ),
            ],
          ),
        ],
      ),
    );
  }
}
