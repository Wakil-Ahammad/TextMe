import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonType;
  final Function()? onTap;
  const MyButton({super.key, required this.buttonType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              buttonType,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
        ),
      ),
    );
  }
}