import 'package:courseup/features/Home/presentation/widgets/course_card_custom_widget/custom_course_card.dart';
import 'package:courseup/features/sharedWidgetsBetweenScreens/my_main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({super.key});
//TODO get data from db
  @override
  Widget build(BuildContext context) {
    
    return MyMainAppBar(
      myBody: ListView.separated(
        separatorBuilder: (context, index) => Gap(5),
        itemCount: 5,
        itemBuilder: (context, index) {
          return CustomCourseCard(name: "Hello", description: "Description for course" , videoNums: index, imagePath: "image path $index" , ratingCount: 5, rating:5);
        },
      ),
    );
  }
}
