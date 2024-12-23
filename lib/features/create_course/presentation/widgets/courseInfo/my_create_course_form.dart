import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../sharedWidgetsBetweenScreens/my_text_form_field.dart';
import '../../MyController/cubits/myCourseDataCubit/my_course_data_cubit.dart';

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
    final myUploadingDataCubit = context.read<MyCourseDataCubit>();
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
                  myUploadingDataCubit.takeTitle(value);
                  debugPrint(
                      "course uploaded his data is name = ${myUploadingDataCubit.myCourse.title} || desc = ${myUploadingDataCubit.myCourse.description}  ||   price = ${myUploadingDataCubit.myCourse.price}");

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
                  myUploadingDataCubit.takePrice(double.parse(value));
                  debugPrint("price ok");
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
                  myUploadingDataCubit.takeDescription(value);
                                    debugPrint("disc ok");

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
