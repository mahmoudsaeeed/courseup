import 'package:courseup/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class MyLoginBtn extends StatelessWidget {
  const MyLoginBtn({
    super.key,
    required this.formState,
    required this.myButtonText,
    required this.myEmail,
    required this.myPassword,
  });
  final GlobalKey<FormState> formState;
  final String myButtonText;

  final TextEditingController myEmail;
  final TextEditingController myPassword;

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
            //TODO check if data is correct and stored 
            //TODO navigate to home page
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
