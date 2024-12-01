import 'package:flutter/material.dart';

import '../../../../../core/utils/my_colors.dart';

class MySignupBtn extends StatelessWidget {
  const MySignupBtn({
    super.key,
    required this.formState,
    required this.myButtonText,
    required this.myNameController,
    required this.myEmailController,
    required this.myPasswordController,
    required this.mySecondPasswordController,
  });
  final GlobalKey<FormState> formState;
  final String myButtonText;

  final TextEditingController myNameController;
  final TextEditingController myEmailController;
  final TextEditingController myPasswordController;
  final TextEditingController mySecondPasswordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width - 50,
      height: 50,

      child: ElevatedButton(
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            MyColors.myPrimaryKey,
          ),
          alignment: Alignment.center,
        ),
        onPressed: () {
          if (formState.currentState!.validate()) {
            debugPrint("validation success");

            //TODO send data to db to store
          } else {
            debugPrint("Validation error");
          }
        },
        child: Text(
          myButtonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
