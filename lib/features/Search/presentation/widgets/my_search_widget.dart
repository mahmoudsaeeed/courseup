import 'package:flutter/material.dart';

class MySearchWidget extends StatefulWidget {
  const MySearchWidget({super.key});

  @override
  State<MySearchWidget> createState() => _MySearchWidgetState();
}

class _MySearchWidgetState extends State<MySearchWidget> {
  List<Map> myData = [
    {
      'id': 1,
      'name': "hello 0",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SearchAnchor(
          builder: (context, controller) {
            return Center(
              child: Container(
                child: const Icon(Icons.search),
              ),
            );
          },
          suggestionsBuilder: (context, controller) {
            if (controller.isOpen) {
              debugPrint("suggestion is opened");
            }
            if (controller.isAttached) {
              debugPrint("attach ------------------");
              debugPrint(" ${controller.text} ");
            }
            return List<ListTile>.generate(

                5,
                (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                      color: Colors.black54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text("leading"),
                    ),

                    title: Text(item),
                    subtitle: Text("description description description"),
                    onTap: () {
                      debugPrint("item is : ${controller.isOpen}");
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}
