import 'package:flutter/material.dart';

import '../../core/utils/my_colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.onPressed, required this.buttonName});
  final void Function()? onPressed;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.mySecondaryColor,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(color: MyColors.myThirdColor),
        ),
      ),
    );
  }
}
