import 'package:flutter/material.dart';


//! unUsed
class MyFormContainer extends StatelessWidget {
  const MyFormContainer({
    super.key,
    required this.myFormWidget,
  });
  final Widget myFormWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 15,
            spreadRadius: .01,
            color: Colors.black,
          ),
        ],
        color: Colors.white,

        // color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50),
      child: myFormWidget,
    );
  }
}
