import '../constants/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;

  const Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: tdBlack, borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Text(
            'Log In',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
