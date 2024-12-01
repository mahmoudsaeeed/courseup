import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    super.key,
    required this.myController,
    required this.myHint,
    this.myValidator,
    this.isSecret = false,
  });

  final TextEditingController myController;
  final String? Function(String?)? myValidator;
  final bool isSecret;
  final String myHint;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool isDisplayed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 4,
              spreadRadius: .01,
              color: Colors.black,
            ),
          ],
        ),
        child: TextFormField(
          controller: widget.myController,
          validator: widget.myValidator,
          obscureText: isDisplayed,
          decoration: InputDecoration(
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
              gapPadding: 5,
              borderSide: BorderSide.none,
            ),
            isDense: true,
            hintText: widget.myHint,
            filled: true,
            // suffix: widget.isSecret
            //     ? IconButton(
            //         padding: const EdgeInsets.all(0),
            //         visualDensity: VisualDensity.compact,
            //         style: const ButtonStyle(),
            //         onPressed: () {
            //           setState(() {
            //             isDisplayed = !isDisplayed;
            //           });
            //         },
            //         icon: isDisplayed
            //             ? const Icon(
            //                 Icons.lock_outline_rounded,
            //                 color: Colors.blue,
            //               )
            //             : const Icon(Icons.lock_open_rounded),
            //         color: Colors.red,
            //       )
            //     : null,
          ),
        ),
      ),
    );
  }
}
