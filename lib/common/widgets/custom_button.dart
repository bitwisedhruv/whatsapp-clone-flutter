import 'package:connectr/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: tabColorDarkOld,
        minimumSize: const Size(double.infinity, 50,)
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: blackColor,
        ),
      ),
    );
  }
}
