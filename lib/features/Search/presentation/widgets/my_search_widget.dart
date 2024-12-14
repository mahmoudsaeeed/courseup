import 'package:courseup/features/Search/presentation/widgets/my_searched_list_tile_widget.dart';
import 'package:courseup/features/create_course/domain/my_course_entity.dart';
import 'package:flutter/material.dart';

class MySearchWidget extends StatefulWidget {
  const MySearchWidget({super.key});

  @override
  State<MySearchWidget> createState() => _MySearchWidgetState();
}

class _MySearchWidgetState extends State<MySearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) {
        return const Icon(Icons.search);
      },
      suggestionsBuilder: (context, controller) {
        if (controller.isOpen) {
          debugPrint("suggestion is opened");
        }
        if (controller.isAttached) {
          debugPrint("attach ------------------");
          debugPrint(" ${controller.text} ");
        }
        return List.generate(
          5, //?TODO  courses that match what user write
          (int index) {
            return MySearchedListTileWidget(
              myController: controller,
              //TODO pass the course here
              myCourse: MyCourseEntity(
                courseId: "1",
                title: "title",
                description: "descriptio",
                imageUrl: "imageURL",
                videosUrl: ["video1URL", "video2"],
                price: 3000,
                publisherId: "5",
              ),
            );
          },
        );
      },
    );
  }
}
