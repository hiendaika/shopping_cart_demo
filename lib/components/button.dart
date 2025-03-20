// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  void Function()? onPressed;
  final Widget? child;
  MyButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: EdgeInsets.all(25),

        child: child,
      ),
    );
  }
}
