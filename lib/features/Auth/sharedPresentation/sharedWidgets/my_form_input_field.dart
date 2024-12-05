import 'package:courseup/core/utils/my_colors.dart';
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
      child: TextFormField(
        controller: widget.myController,
        validator: widget.myValidator,
        obscureText: isDisplayed,
        decoration: InputDecoration(
          hintText: widget.myHint,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.secondaryColor,
              width: 2,
            ),
          ),
        ),
        cursorColor: MyColors.secondaryColor,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
