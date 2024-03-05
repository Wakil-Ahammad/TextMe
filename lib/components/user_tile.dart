import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [const Icon(Icons.person), Text(text, style: const TextStyle(fontWeight: FontWeight.bold),)],
        ),
      ),
    );
  }
}
