import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureFlag;
  final TextEditingController controller;
  final FocusNode? focusNode;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obsecureFlag,
      required this.controller,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        obscureText: obsecureFlag,
        focusNode: focusNode,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            fillColor: Theme.of(context).colorScheme.primary,
            filled: true,
            hintText: hintText,
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary)),
      ),
    );
  }
}
