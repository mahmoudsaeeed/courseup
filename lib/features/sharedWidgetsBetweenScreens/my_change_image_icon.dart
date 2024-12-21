import 'package:flutter/material.dart';

class MyChangeImageIcon extends StatelessWidget {
  const MyChangeImageIcon({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        child: IconButton(
            onPressed: onPressed, icon: const Icon(Icons.camera_alt_outlined)));
  }
}