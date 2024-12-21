import 'package:courseup/features/create_course/data/models/my_course.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../sharedWidgetsBetweenScreens/my_text_form_field.dart';
import '../../MyController/provider/my_course_updating_data.dart';

class MyCreateCourseForm extends StatefulWidget {
  const MyCreateCourseForm({super.key, required this.formState});
  final GlobalKey<FormState> formState;

  @override
  State<MyCreateCourseForm> createState() => _MyCreateCourseFormState();
}

class _MyCreateCourseFormState extends State<MyCreateCourseForm> {
  late TextEditingController myCourseTitle;
  late TextEditingController myCoursePrice;
  late TextEditingController myCourseDesc;
  // late ;

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
    final myCourseProvided = context.read<MyCourseUpdatingData>();
    MyCourse newCourse = MyCourse();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: widget.formState,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        
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
              onSaved: (value) {
                if (value != null) {
                  newCourse.title = value;
                  debugPrint(
                      "course uploaded his data is name = ${newCourse.title} || desc = ${newCourse.description}  ||   price = ${newCourse.price}");
                  
                  // myCourseProvided.uploadData(newCourse);
                }
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
              onSaved: (value) {
                if (value != null) {
                  newCourse.price = double.parse(value);
                }
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
              onSaved: (value) {
                if (value != null) {
                  newCourse.description = value;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
