import 'package:courseup/features/sharedWidgetsBetweenScreens/my_button.dart';
import 'package:flutter/material.dart';

class MyCreateCourseSaveButton extends StatelessWidget {
  const MyCreateCourseSaveButton({
    super.key,
    required this.formState,
  });

  final GlobalKey<FormState> formState;
  @override
  Widget build(BuildContext context) {
    // final res = BlocProvider.of<MyCourseDataCubit>(context);
    // final imgUrl = Provider.of<MyCourseImgProvider>(context);
    return SizedBox(
      // width: 200,
      child: MyButton(
        buttonName: "Save",
        onPressed: () {
          //TODO get the data of title , price and desc here from sharedpreferences

          if (formState.currentState!.validate()) {
            formState.currentState!.save();

            // debugPrint(
            //     "name : ${res.myCourse.title}\ndesc : ${res.myCourse.description}\nprice : ${res.myCourse.price}\nimgUrl = ${res.myCourse.imageUrl}");
          }
          // Test.showNotWorkMsg(context);
        },
      ),
    );
  }
}
