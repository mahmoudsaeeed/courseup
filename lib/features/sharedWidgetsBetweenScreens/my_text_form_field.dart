import 'package:courseup/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    super.key,
    required this.myController,
    required this.myHint,
    this.myValidator,
    this.isSecret = false,
    this.isNumber = false,
    this.isEmail = false,
    this.onEditingComplete, this.onChanged, this.onSaved,
  });

  final TextEditingController myController;
  final String? Function(String?)? myValidator;
  final bool isSecret;
  final String myHint;
  final bool isNumber;
  final bool isEmail;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  late bool isObsecure;
  @override
  void initState() {
    super.initState();
    isObsecure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: widget.myController,
        validator: widget.myValidator,
        obscureText: isObsecure,
        keyboardType: widget.isNumber
            ? TextInputType.number
            : widget.isEmail
                ? TextInputType.emailAddress
                : null,
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        decoration: widget.isSecret
            ? InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () => setState(() {
                      isObsecure = !isObsecure;
                    }),
                    icon: isObsecure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
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
                    color: MyColors.mySecondaryColor,
                    width: 2,
                  ),
                ),
              )
            : InputDecoration(
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
                    color: MyColors.mySecondaryColor,
                    width: 2,
                  ),
                ),
              ),
        cursorColor: MyColors.mySecondaryColor,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
