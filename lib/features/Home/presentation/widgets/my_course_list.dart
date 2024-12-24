import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({super.key});
//TODO get data from db
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Gap(5),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
