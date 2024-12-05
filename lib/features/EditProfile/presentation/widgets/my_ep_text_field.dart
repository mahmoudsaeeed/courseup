import 'package:flutter/material.dart';

class MyEpTextField extends StatefulWidget {
  const MyEpTextField({
    super.key,
    this.isPassword = false,
    required this.myLabel,
    this.myValidator,
  });

  final bool isPassword;
  final String myLabel;
  final String? Function(String?)? myValidator;
  @override
  State<MyEpTextField> createState() => _MyEpTextFieldState();
}

class _MyEpTextFieldState extends State<MyEpTextField> {
  bool isDisplay = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: isDisplay ? isDisplay : !isDisplay,
        validator: widget.myValidator,
        decoration: InputDecoration(
          label: Text(
            widget.myLabel,
          ),
          suffix: widget.isPassword
              ? IconButton(
                  onPressed: () {},
                  icon: isDisplay
                      ? const Icon(
                          Icons.lock_open_outlined,
                        )
                      : const Icon(
                          Icons.lock_outline,
                        ),
                )
              : null,
        ),
      ),
    );
  }
}
