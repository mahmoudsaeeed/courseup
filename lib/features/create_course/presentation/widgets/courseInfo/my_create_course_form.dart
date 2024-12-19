import 'package:flutter/material.dart';

import '../../../../sharedWidgetsBetweenScreens/my_text_form_field.dart';

class MyCreateCourseForm extends StatefulWidget {
  const MyCreateCourseForm({super.key});

  @override
  State<MyCreateCourseForm> createState() => _MyCreateCourseFormState();
}

class _MyCreateCourseFormState extends State<MyCreateCourseForm> {
  late TextEditingController myCourseTitle;
  late TextEditingController myCoursePrice;
  late TextEditingController myCourseDesc;
  // late GlobalKey<FormState> myFormState;

  @override
  void initState() {
    super.initState();
    // myFormState = GlobalKey<FormState>();
    myCourseTitle = TextEditingController();
    myCoursePrice = TextEditingController();
    myCourseDesc = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        // key: myFormState,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            MyTextFormField(
              myController: myCourseTitle,
              myHint: "Title",
              myValidator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Course's title";
                } else {
                  return null;
                }
              },
              onEditingComplete: () {
                //TODO save the value of title in sharedPreferences
              },
            ),
            MyTextFormField(
              myController: myCoursePrice,
              isNumber: true,
              myHint: "Price",
              myValidator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Course's price";
                }
                if (value
                    .contains(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~$]")) {
                  return "invalid value, Please Enter only Numbers";
                }
                return null;
              },
              onEditingComplete: () {
                //TODO save the value of price in sharedPreferences
              },
            ),
            MyTextFormField(
              myController: myCourseDesc,
              myHint: "Description",
              myValidator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Course's description";
                }

                return null;
              },
              onEditingComplete: () {
                //TODO save the value of desc in sharedPreferences
              },
            ),
          ],
        ),
      ),
    );
  }
}
