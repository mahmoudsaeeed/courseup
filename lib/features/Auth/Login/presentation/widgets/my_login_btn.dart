import 'package:courseup/core/constants.dart';
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
      width: MediaQuery.of(context).size.width,
      height: 50,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.secondaryColor, // Button color
          alignment: Alignment.center, // Center-align the content
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Adjust the radius to your needs
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 16.0), // Adds height to the button
        ),
        onPressed: () {
          if (formState.currentState!.validate()) {
            debugPrint("validation success");
            // MyUser myUser = MyUser(email: myEmail.text , );
            // BlocProvider.of<AuthCubit>(context).login(
            //   myUser, //!  change to myEmail not myUser
            //   myPassword.text,
            // );
            Navigator.pushReplacementNamed(context, MyPages.myViewProfilePage);
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
