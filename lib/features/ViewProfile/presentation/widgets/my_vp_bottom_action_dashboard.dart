import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class MyVpBottomActionDashboard extends StatelessWidget {
  const MyVpBottomActionDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Account",
            style: MyCustomFonts.smallText,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "switch to another account !",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure for log out ? "),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut().then((c) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  MyPages.myLoginPage,
                                );
                              });
                            },
                            child: const Text("yes"))
                      ],
                    ),
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red)),
                child: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
